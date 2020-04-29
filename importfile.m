function hasil = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  DAY131032020MARK1 = IMPORTFILE(FILENAME) reads data from text file
%  FILENAME for the default selection.  Returns the data as a table.
%
%  DAY131032020MARK1 = IMPORTFILE(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  day131032020mark1 = importfile("D:\UNAIR\STUDY\SKRIPSI\CODING\ODI\day1_31032020_mark_1.csv", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 09-Apr-2020 11:43:34

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Setup the Import Options
opts = delimitedTextImportOptions("NumVariables", 7);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Timeemg", "EMG", "Timesudut", "Sudut", "Timetimestamp", "Timestamp", "Realtime"];
opts.VariableTypes = ["categorical", "double", "string", "double", "string", "string", "double"];
opts = setvaropts(opts, [3, 5, 6], "WhitespaceRule", "preserve");
opts = setvaropts(opts, [1, 3, 5, 6], "EmptyFieldRule", "auto");
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
hasil = readtable(filename, opts);

end