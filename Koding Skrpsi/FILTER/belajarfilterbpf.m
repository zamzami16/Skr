addpath('Z:\UNAIR\STUDY\SKRIPSI\DATA\DATA_odi2kg_(6)2019_10_1_5999');
data=csvread('DATA_odi2kg_(6)2019_10_1_5999.csv',1,1);
emg=data(:,7);
ti=data(:,4);
sudut=data(:,6);

plot(ti,sudut,'.',ti,emg,'-.');
[b a]=bp_synth(3,200,380,10000);
s=[filter(b,a,emg)];
plot(ti,s)