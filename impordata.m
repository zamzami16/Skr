%% import data
% created by mohyusufz
% thanks, matlab help
clear all; clc;
addpath('ODI\');
addpath('Koding Skrpsi\');
fprintf('starting, Please wait ...\n');
for j=1:18
    fil = 'day2_01042020_mark_%d.csv';
    file = sprintf(fil, j);
    data = getdata(file);
    nam = 'RAW_02_%d.mat';
    name = sprintf(nam, j);
    save(name, '-struct', 'data');
    fprintf('now, %d saved\n',j)
end
fprintf('selesai...\n');
%%