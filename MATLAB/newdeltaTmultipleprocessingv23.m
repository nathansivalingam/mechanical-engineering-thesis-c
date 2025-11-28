%% Load Baseline and VG mat files
clear 

[fv,pv] = uigetfile({'*.mat'},'Select VG Data');
load([pv,fv])
vg_result = test_result;
%% ask for user input for which cell and data to be calculated
prompt = {'Which line of VG data do you want to start from?', 'Which line of VG data do you want to end at?'};
dlgtitle = 'Select line number';
dims = [1 35];
default_values = {'1', '2'};
user_input = inputdlg(prompt, dlgtitle, dims, default_values);
start_line_input = str2num(user_input{1});
end_line_input = str2num(user_input{2});

% return error for invalid inputs 
if start_line_input < 1
    error('Invalid starting line, computation must start from line 1.');
end 
if end_line_input > length(vg_result)
    error('Invalid ending line, ending line input exceeded length of VG logbook.');
end

% ask user input for area of computation
prompt = {'row number of the top left corner', 'column number of the top left corner', 'row number of the top right corner', 'column number of the top right corner', 'row number of the bottom left corner', 'column number of the bottom left corner', 'row number of the bottom right corner', 'column number of the bottom right corner'};
dlgtitle = 'Select corners of the area of interest';
dims = [1 60];
default_values = {'3', '5', '3', '7', '4', '5', '4', '7',};
user_input = inputdlg(prompt, dlgtitle, dims, default_values);
x1 = str2num(user_input{1});
y1 = str2num(user_input{2});
x2 = str2num(user_input{3});
y2 = str2num(user_input{4});
x3 = str2num(user_input{5});
y3 = str2num(user_input{6});
x4 = str2num(user_input{7});
y4 = str2num(user_input{8});

% check for input errors 
if x1 ~= x2 || x3 ~= x4
    error('The selected area is not a rectangle')
end
if y1 ~= y3 || y2 ~= y4
    error('The selected area is not a rectangle')
end
%% ask for which baseline file to use for processing 
[file, path] = uigetfile({'*.mat'},'Select baseline logbook');
%% initilise output variable 
input_lines = start_line_input:end_line_input;
output = struct('line_number', [], 'deltaT', []', 'equiv_b_temp', []);
%% loop through the selected lines of data
counter = 1;
for current_line = start_line_input:end_line_input
    % find the average of that particular line of VG data
    average_VG = average_per_cell(vg_result(current_line));
    average_VG = average_VG.Mean_cell;
    output(counter).Mean_cell = average_VG;

    % finds the correlation between ambient temp and baseline temp
    correlation_result = correlation_multiple_processing_v2(path, file);
    
    % select the correct correlation result based on the speed
    if vg_result(current_line).speed < 2
        correlation_result = correlation_result{1};
    end
    if vg_result(current_line).speed >= 2 && vg_result(current_line).speed < 3
        correlation_result = correlation_result{2};
    end
    if vg_result(current_line).speed >= 3
        correlation_result = correlation_result{3};
    end
    
    amb_temp = vg_result(current_line).T_refl;
    equiv_b_temp = zeros(6, 10);
    for row = 1:6
        for col = 1:10
            equiv_b_temp(row, col) = correlation_result(row, col).fit(amb_temp);
        end
    end
    output(counter).equiv_b_temp = equiv_b_temp;
    output(counter).delta_T_per_cell = equiv_b_temp - average_VG;

    % find the delta T
    average_VG = average_VG(x1:x3, y1:y2);
    average_VG = mean(average_VG(:));
    equiv_b_temp = equiv_b_temp(x1:x3, y1:y2);
    equiv_b_temp = mean(equiv_b_temp(:));
    deltaT = average_VG - equiv_b_temp;
    fprintf('%.3f - %.3f = %.3f\n', average_VG, equiv_b_temp, deltaT); % Average_VG - Equiv_b_temp = Delta_t

    % insert delta T of current line into the output vector 
    output(counter).line_number = start_line_input + counter - 1;
    output(counter).deltaT = deltaT;
    counter = counter + 1;
end
disp('Negative value represents cooling')