function y=bpf_emg(emg,f1,f2,fs)
filt1 = fdesign.highpass('n,f3db',4,2*f1*(1/fs)); %high-pass filter, cut off frequency at f1 Hz, sampling frequency of 1kHz
H1 = design(filt1,'butter');
highpass_EMG = filter(H1,emg); % sampling frequency of 1kHz
% Low-pass filter
filt2 = fdesign.lowpass('n,f3db',4,2*f2*(1/fs)); %low-pass filter, cut off frequency at 500Hz
H2 = design(filt2,'butter');
lowpass_EMG = filter(H2,highpass_EMG);
% Notch Filter (50Hz)
filt3 = fdesign.notch(4,0.05,10); %notch filter (50Hz)
H3 = design(filt3);
cleaned_EMG = filter(H3,lowpass_EMG);
y=cleaned_EMG;
%figure(1);plot(cleaned_EMG);