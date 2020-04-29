%% slice data 15 sec, from 2 to 17 sec
% sampling rate is 10000 (10Khz), so, 
% the data from 20001 to 170001
% created by mohyusufz
%%
clear all; clc;
addpath('ODI_RAW');
fprintf('starting ..\n');
    for j=1:18
        fil = 'RAW_02_%d.mat';
        file = sprintf(fil, j);
        load(file);
        % data ori
        o_emg = ori.emg(30001:180001);
        o_theta = ori.theta(30001:180001);
        o_sampling = ori.sampling(30001:180001);
        % data filtered
        f_emg = filtered.emg(30001:180001);
        f_theta = filtered.theta(30001:180001);
        f_sampling = filtered.sampling(30001:180001);
        R.old.ori = ori;
        R.old.filtered = filtered;
        clear filtered;
        clear ori;
        R.cuted.ori.emg = o_emg;
        R.cuted.ori.theta = o_theta;
        R.cuted.ori.sampling = o_sampling;
        filtered.emg = f_emg;
        filtered.theta = f_theta;
        filtered.sampling = f_sampling;
        nam = 'cuted_15s_02_%d.mat';
        name = sprintf(nam, j);
        save(name, '-struct', 'filtered');
        now = 'now, cuted_02_%d.mat saved\n';
        fprintf(now, j);
    end
fprintf('mari...\n');
