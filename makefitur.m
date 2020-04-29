%% Get feature extraction from the data
% give, 1. zc
%       2. iemg
%       3. theta
%       4. ts (sampling)
% Created by mohyusufz
%%
addpath('Cut_15s');
Ts = 10000;
window = 2500;
tres = 0.1;
sprintf('starting ...\n');
for i=1:18
    fil = 'cuted_15s_02_%d.mat';
    file = sprintf(fil, i);
    load(file);
    fitur = fiturEkstraksi(emg, theta, sampling, Ts, window, tres);
    % uncomment bellow for subplots
    mysubplot(fitur.zc, fitur.iemg, fitur.theta, fitur.ts, i);
    multiplot(fitur.zc, fitur.iemg, fitur.theta, fitur.ts, i);
    fil = 'fitur_02_%d.mat';
    file = sprintf(fil, i);
    save(file, '-struct', 'fitur');
    sprintf('fitur_%d, saved!', i);
    clear emg;
    clear sampling;
    clear theta;
    clear hasil;
end
sprintf('selesai ...');

%% Local function for plots
function hasil = mysubplot(zc, iemg, theta, sampling, i)
hasil = figure(1);
subplot(3, 1, 1);
plot(sampling, theta, 'b');
ylabel('\theta');
xlabel('s');

subplot(3, 1, 2);
plot(sampling, zc, 'r');
ylabel('ZC');
xlabel('s');

subplot(3, 1, 3);
plot(sampling, iemg, 'k');
ylabel('iemg (V)');
xlabel('s');

nim = sprintf('fitur_sub_%d.png', i);
saveas(hasil, nim);
clf;
sprintf('subplot saved ...');
end

function hasil = multiplot(zc, iemg, theta, ts, i)
hasil = figure(2);
plot(ts, theta);
hold on, plot(ts, zc);
plot(ts, iemg);
legend('\theta', 'ZC', 'IEMG');
nim = sprintf('fitur_mul_%d.png', i);
saveas(hasil, nim);
clf;
sprintf('multiplot saved ...');
end