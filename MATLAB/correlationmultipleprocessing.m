%% correlation between ambient and baseline temperature 
% this code finds the correlation between the ambient and baseline
% temperature through existing baseline data 

function output = correlation_multiple_processing_v2(path, file)
    % see if the correlation has been computed before or not, if it has
    % been computed, return computed result; else follow codes below

    % load baseline file first 
    load([path, file]);

    % find the indices of the intended data under different speeds 
    b1 = find([test_result.speed]' < 2);
    b2 = find([test_result.speed]' >= 2 & [test_result.speed]' < 3);
    b3 = find([test_result.speed]' >= 3);

    % initialise the variables needed to contain the averages of the
    % intended cells under different speeds 
    average_b1 = struct('result_per_cell', [], 'Amb_temp', []);
    average_b2 = struct('result_per_cell', [], 'Amb_temp', []);
    average_b3 = struct('result_per_cell', [], 'Amb_temp', []);
    
    % finding the actual averages of each individual cell under different speeds respectively 
    % loop through each cell of each test which speed = 1m/s
    for i = 1:size(b1, 1)
        result_per_cell = average_per_cell(test_result(b1(i))); % this will be a struct containing data of line 'i' of test_result
        result_per_cell = result_per_cell.Mean_cell; % this will be a column vector 
        average_b1(i).result_per_cell = result_per_cell;
        average_b1(i).Amb_temp = test_result(b1(i)).T_refl;
    end

    % loop through each cell of each test which speed = 2m/s
    for i = 1:size(b2, 1)
        result_per_cell = average_per_cell(test_result(b2(i))); % this will be a struct containing data of line 'i' of test_result
        result_per_cell = result_per_cell.Mean_cell; % this will be a column vector 
        average_b2(i).result_per_cell = result_per_cell;
        average_b2(i).Amb_temp = test_result(b2(i)).T_refl;
    end

    % loop through each cell of each test which speed = 3m/s
    for i = 1:size(b3, 1)
        result_per_cell = average_per_cell(test_result(b3(i))); % this will be a struct containing data of line 'i' of test_result
        result_per_cell = result_per_cell.Mean_cell; % this will be a column vector 
        average_b3(i).result_per_cell = result_per_cell;
        average_b3(i).Amb_temp = test_result(b3(i)).T_refl;
    end

    % initialise a new dataset for computing linear interpolation later
    dataset = struct('speed_1ms', [], 'speed_1ms_amb_temp', [], 'speed_2ms', [], 'speed_2ms_amb_temp', [], 'speed_3ms', [], 'speed_3ms_amb_temp', []);
    
    % putting data at 1m/s across all cells into this new dataset
    for i = 1:length(average_b1)
        dataset(i).speed_1ms = average_b1(i).result_per_cell;
        dataset(i).speed_1ms_amb_temp = average_b1(i).Amb_temp;
    end

    for i = 1:length(average_b2)
        dataset(i).speed_2ms = average_b2(i).result_per_cell;
        dataset(i).speed_2ms_amb_temp = average_b2(i).Amb_temp;
    end

    for i = 1:length(average_b3)
        dataset(i).speed_3ms = average_b3(i).result_per_cell;
        dataset(i).speed_3ms_amb_temp = average_b3(i).Amb_temp;
    end
    
    % the output of this function will be a 6 by 10 cell, with each cell
    % containing the correlation of each cell of the PV module. There will
    % be three of these cells representing the three different speeds. 
    
    % initialise the fit_result structure first
    fit_result_1ms(6, 10) = struct();
    fit_result_2ms(6, 10) = struct();
    fit_result_3ms(6, 10) = struct();

    % computting correlation for each cell for speed = 1m/s
    for row = 1:6
        for col = 1:10 
            x_values = zeros(length([dataset.speed_1ms_amb_temp]), 1);
            y_values = zeros(length([dataset.speed_1ms_amb_temp]), 1);
            for counter = 1:length([dataset.speed_1ms_amb_temp])
                x_values(counter) = dataset(counter).speed_1ms_amb_temp;
                y_values(counter) = dataset(counter).speed_1ms(row, col); % temp per cell not properly stored in this line, 
            end
            fit_result_1ms(row, col).fit = fit(x_values, y_values, 'poly1');
        end
    end

    % computting correlation for each cell for speed = 2m/s
    for row = 1:6
        for col = 1:10
            x_values = zeros(length([dataset.speed_2ms_amb_temp]), 1);
            y_values = zeros(length([dataset.speed_2ms_amb_temp]), 1);
            for counter = 1:length([dataset.speed_2ms_amb_temp])
                x_values(counter) = dataset(counter).speed_2ms_amb_temp;
                y_values(counter) = dataset(counter).speed_2ms(row, col);
            end
            fit_result_2ms(row, col).fit = fit(x_values, y_values, 'poly1');
        end
    end

    % for computting correlation for each cell for speed = 3m/s
    for row = 1:6
        for col = 1:10
            x_values = zeros(length([dataset.speed_3ms_amb_temp]), 1);
            y_values = zeros(length([dataset.speed_3ms_amb_temp]), 1);
            for counter = 1:length([dataset.speed_3ms_amb_temp])
                x_values(counter) = dataset(counter).speed_3ms_amb_temp;
                y_values(counter) = dataset(counter).speed_3ms(row, col);
            end
            fit_result_3ms(row, col).fit = fit(x_values, y_values, 'poly1');
        end
    end
    
    % return outputs 
    output = {fit_result_1ms; fit_result_2ms; fit_result_3ms};

end