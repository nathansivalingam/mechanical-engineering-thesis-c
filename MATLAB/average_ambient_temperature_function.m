% Input: HH:MM, Output: Average Ambient Temperature at HH:MM
% By Nathan Sivalingam (March, 2025)

clc
filename = 'CoolTerm Capture 2025-05-23 13-48-06.txt';
fid = fopen(filename, 'r');
if fid == -1
    error('Cannot open file');
end
data = textscan(fid, '%s', 'Delimiter', '\n');
fclose(fid);
lines = data{1};
while true
    try
        target_time = input('Enter target time (HH:MM): ', 's');
    catch
        disp('EOF received. Exiting.');
        break;
    end
    fifth_col_values = [];
    for i = 1:length(lines)
        line = strtrim(lines{i});
        if isempty(line)
            continue;
        end
        cols = strsplit(line, '\t');
        if length(cols) >= 5
            datetime_str = cols{1};  % Example: '2025-04-07 13:40:29'
            try
                dt = datetime(datetime_str, 'InputFormat', 'yyyy-MM-dd HH:mm:ss');
                current_time_str = datestr(dt, 'HH:MM');
            catch
                continue;
            end
            if strcmp(current_time_str, target_time)
                disp(line);
                val = str2double(cols{5});
                if ~isnan(val)
                    fifth_col_values(end+1) = val;
                end
            end
        end
    end
    if ~isempty(fifth_col_values)
        avg_val = mean(fifth_col_values);
        fprintf('Average of 5th column for %s entries: %.2f\n', target_time, avg_val);
    else
        fprintf('No matching entries found for %s\n', target_time);
    end
end