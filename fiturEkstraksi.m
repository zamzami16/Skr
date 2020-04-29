function [fitur] = fiturEkstraksi(remg, theta, T, Ts, window, tresholdZC)
%% fitur extraction function
% give, 1. zc
%       2. iemg
%       3. theta
%       4. ts (sampling)
% Created by mohyusufz
%%
addpath('Koding Skrpsi');
ll = (length(remg) / window) - 1;
for k = 0:ll
    j = k * window;    
    for jj = 1:window
        emgs(jj) = remg(j+jj);
        thetas(jj) = theta(j+jj);
    end
    zc(k+1) = jZC(emgs, tresholdZC);
    iemg(k+1) = sum(abs(emgs));
    thetaS(k+1) = thetas(window);
end
ts = 0:(Ts*window):Ts*window*ll;
fitur.zc = zc';
fitur.iemg = iemg';
fitur.theta = thetaS';
fitur.ts = ts';
clear 'zc';
clear 'iemg';
clear thetaS;
end