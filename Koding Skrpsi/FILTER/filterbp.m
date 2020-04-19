addpath('Z:\UNAIR\STUDY\SKRIPSI\DATA\DATA_odi2kg_(6.2)2019_10_1_2999');
filename = 'DATA_odi2kg_(6.2)2019_10_1_2999.csv';                                           % Provide Correct File Name
D = csvread(filename,1,1);
t = D(:,4);                                                     % Time Vector
EMG = D(:,7);                                                   % EMG Data
Ts = mean(diff(t));                                             % Sampling Interval
Fs    = 1/Ts;                                                   % Sampling Frequency 
Fn    = Fs/2;                                                   % Nyquist Frequency
Freq1 =   2;                                                    % Passband Frequency, Hz (Lower)
Freq2 = 100;                                                    % Passband Frequency, Hz (Upper)
Wp    = [Freq1 Freq2]/Fn;                                       % Passband Frequencies (Normalised)
Ws    = [1  110];                                               % Stopband Frequencies (Normalised)
Rp    =  1;                                                     % Passband Ripple
Rs    = 50;                                                     % Stopband Ripple
[n,Wn] = buttord(Wp,Ws,Rp,Rs);                                  % Calculate Filter Order
[z,p,k] = butter(n,Wn);                                         % Calculate Filter
[sos,g] = zp2sos(z,p,k);                                        % Convert To Second-Order-Section For Stability
figure(1)
freqz(sos, 2^14, Fs)                                            % Filter Bode Plot
EMG_Filtered = filtfilt(sos, g, EMG);                           % Filter EMG
figure(2)
plot(t, EMG_Filtered)
grid