function [result] = getdata(file)
%% getData, get data from a file
% created on 11 April, 2020 by mohyusufz
%% importfile
% need "importfile.m", import the data in table format
dataa = importfile(file);
%% get each data, emg, theta, and sampling time
remg = dataa(2:end,2);
theta = dataa(2:end,4);
sampling = dataa(2:end,7);
%% convert to double 
remg = table2array(remg);
theta = table2array(theta);
sampling = table2array(sampling);

result.ori.emg = remg;
result.ori.theta = theta;
result.ori.sampling = sampling;

%% filter data with IIR Butterword Filter with orde 2
fcl = 500; %500Hz
fch = 20; %20Hz
fs = 10000; %fs 10KHz
wo = 50/(10000/2);
bw = wo/35; %using Q factor 35
%filtered_emg = bandpass(remg, [fch fcl], fs);

%filtered_emg = bpf_emg(remg,fch, fcl, fs);
[nb, na] = iirnotch(wo, bw);
[lb, la] = butter(2, fcl/(fs/2)); % 
[hb, ha] = butter(2, fch/(fs/2), 'high');
%freqz(lb, la);
%hold on, freqz(hb, ha);
%hold off,
notch = filter(nb, na, result.ori.emg);
fl = filter(lb, la, notch);
filtered_emg = filter(hb, ha, fl);
%sud = filter(lb, la, result.ori.theta);
%filtered_theta = filter(hb, ha, sud);

result.filtered.emg = filtered_emg;
result.filtered.theta = theta;
result.filtered.sampling = sampling;
end