clear; clc;
tic
addpath('ODI');
addpath('Koding Skrpsi');
% get the data
% for i=1:18
%     file = sprintf('day2_01042020_mark_%d.csv', i);
%     data = getdata(file);
%     name = sprintf('data_02_%d.mat', i);
%     %save(name, 'data');
%     clear("data");
%     fprintf('data ke-%d, saved !!\n', i);
% end
data = getdata('day2_01042020_mark_2.csv');
data2 = getdata('day2_01042020_mark_2.csv');
data3 = getdata('day2_01042020_mark_3.csv');
data4 = getdata('day2_01042020_mark_4.csv');
data5 = getdata('day2_01042020_mark_5.csv');
data6 = getdata('day2_01042020_mark_6.csv');
data7 = getdata('day2_01042020_mark_7.csv');
data8 = getdata('day2_01042020_mark_8.csv');
data9 = getdata('day2_01042020_mark_9.csv');
data10 = getdata('day2_01042020_mark_10.csv');
data11 = getdata('day2_01042020_mark_11.csv');
data12 = getdata('day2_01042020_mark_12.csv');
data13 = getdata('day2_01042020_mark_13.csv');
data14 = getdata('day2_01042020_mark_14.csv');
data15 = getdata('day2_01042020_mark_15.csv');
data16 = getdata('day2_01042020_mark_16.csv');
data17 = getdata('day2_01042020_mark_17.csv');
data18 = getdata('day2_01042020_mark_18.csv');

Plot the signal
emgf = data.filtered.emg;
emgf2 = data2.filtered.emg;
emgf3 = data3.filtered.emg;
emgf4 = data4.filtered.emg;
emgf5 = data5.filtered.emg;
emgf6 = data6.filtered.emg;
emgf7 = data7.filtered.emg;
emgf8 = data8.filtered.emg;
emgf9 = data9.filtered.emg;
emgf10 = data10.filtered.emg;
emgf11 = data11.filtered.emg;
emgf12 = data12.filtered.emg;
emgf13 = data13.filtered.emg;
emgf14 = data14.filtered.emg;
emgf15 = data15.filtered.emg;
emgf16 = data16.filtered.emg;
emgf17 = data17.filtered.emg;
emgf18 = data18.filtered.emg;

sudut = data.filtered.theta;
sudut2 = data2.filtered.theta;
sudut3 = data3.filtered.theta;
sudut4 = data4.filtered.theta;
sudut5 = data5.filtered.theta;
sudut6 = data6.filtered.theta;
sudut7 = data7.filtered.theta;
sudut8 = data8.filtered.theta;
sudut9 = data9.filtered.theta;
sudut10 = data10.filtered.theta;
sudut11 = data11.filtered.theta;
sudut12 = data12.filtered.theta;
sudut13 = data13.filtered.theta;
sudut14 = data14.filtered.theta;
sudut15 = data15.filtered.theta;
sudut16 = data16.filtered.theta;
sudut17 = data17.filtered.theta;
sudut18 = data18.filtered.theta;

Ts = data.filtered.sampling;

% yyaxis left;
% plot(Ts, emgf, 'k');
% ylabel('V');
% yyaxis right;
% plot(Ts, sudut);
% ylabel('\theta');
% hold off

potong sinyal
emg = emgf(30001:180000);
theta = sudut(30001:180000);
emg2 = emgf2(30001:180000);
theta2 = sudut2(30001:180000);
emg3 = emgf3(30001:180000);
theta3 = sudut3(30001:180000);
emg4 = emgf4(30001:180000);
theta4 = sudut4(30001:180000);
emg5 = emgf5(30001:180000);
theta5 = sudut5(30001:180000);
emg6 = emgf6(30001:180000);
theta6 = sudut6(30001:180000);
emg7 = emgf7(30001:180000);
theta7 = sudut7(30001:180000);
theta8 = sudut8(30001:180000);
theta9 = sudut9(30001:180000);
theta10 = sudut10(30001:180000);
theta11 = sudut11(30001:180000);
theta12 = sudut12(30001:180000);
theta13 = sudut13(30001:180000);
theta14 = sudut14(30001:180000);
theta15 = sudut15(30001:180000);
theta16 = sudut16(30001:180000);
theta17 = sudut17(30001:180000);
theta18 = sudut18(30001:180000);

emg8 = emgf8(30001:180000);
emg9 = emgf9(30001:180000);
emg10 = emgf10(30001:180000);
emg11 = emgf11(30001:180000);
emg12 = emgf12(30001:180000);
emg13 = emgf13(30001:180000);
emg14 = emgf14(30001:180000);
emg15 = emgf15(30001:180000);
emg16 = emgf16(30001:180000);
emg17 = emgf17(30001:180000);
emg18 = emgf18(30001:180000);

sampling = .0001:.0001:17;
sampling = sampling';
% yyaxis left;
% plot(sampling, emg, 'b');
% ylabel('v');
% yyaxis right;
% plot(sampling, theta,'k');
% ylabel('\theta');

Feature Extraction
treshold = .1;
windo = 2400;

fitur = fiturEkstraksi(emg, theta, sampling, .0001, windo, treshold);
fitur2 = fiturEkstraksi(emg2, theta2, sampling, .0001, windo, treshold);
fitur3 = fiturEkstraksi(emg3, theta3, sampling, .0001, windo, treshold);
fitur4 = fiturEkstraksi(emg4, theta4, sampling, .0001, windo, treshold);
fitur5 = fiturEkstraksi(emg5, theta5, sampling, .0001, windo, treshold);
fitur6 = fiturEkstraksi(emg6, theta6, sampling, .0001, windo, treshold);
fitur7 = fiturEkstraksi(emg7, theta7, sampling, .0001, windo, treshold);
fitur8 = fiturEkstraksi(emg8, theta8, sampling, .0001, windo, treshold);
fitur9 = fiturEkstraksi(emg8, theta9, sampling, .0001, windo, treshold);
fitur10 = fiturEkstraksi(emg10, theta10, sampling, .0001, windo, treshold);
fitur11 = fiturEkstraksi(emg11, theta11, sampling, .0001, windo, treshold);
fitur12 = fiturEkstraksi(emg12, theta12, sampling, .0001, windo, treshold);
fitur13 = fiturEkstraksi(emg13, theta13, sampling, .0001, windo, treshold);
fitur14 = fiturEkstraksi(emg14, theta14, sampling, .0001, windo, treshold);
fitur15 = fiturEkstraksi(emg15, theta15, sampling, .0001, windo, treshold);
fitur16 = fiturEkstraksi(emg16, theta16, sampling, .0001, windo, treshold);
fitur17 = fiturEkstraksi(emg17, theta17, sampling, .0001, windo, treshold);
fitur18 = fiturEkstraksi(emg18, theta18, sampling, .0001, windo, treshold);

iemg = rescale(fitur.iemg, 0, 200);
iemg2 = rescale(fitur2.iemg, 0, 200);
iemg3 = rescale(fitur3.iemg, 0, 200);
iemg4 = rescale(fitur4.iemg, 0, 200);
iemg5 = rescale(fitur5.iemg, 0, 200);
iemg6 = rescale(fitur6.iemg, 0, 200);
iemg7 = rescale(fitur7.iemg, 0, 200);
iemg8 = rescale(fitur8.iemg, 0, 200);
iemg9 = rescale(fitur9.iemg, 0, 200);
iemg10 = rescale(fitur10.iemg, 0, 200);
iemg11 = rescale(fitur11.iemg, 0, 200);
iemg12 = rescale(fitur12.iemg, 0, 200);
iemg13 = rescale(fitur13.iemg, 0, 200);
iemg14 = rescale(fitur14.iemg, 0, 200);
iemg15 = rescale(fitur15.iemg, 0, 200);
iemg16 = rescale(fitur16.iemg, 0, 200);
iemg17 = rescale(fitur17.iemg, 0, 200);
iemg18 = rescale(fitur18.iemg, 0, 200);

zc = fitur.zc;
zc2 = fitur2.zc;
zc3 = fitur3.zc;
zc4 = fitur4.zc;
zc5 = fitur5.zc;
zc6 = fitur6.zc;
zc7 = fitur7.zc;
zc8 = fitur8.zc;
zc9 = fitur9.zc;
zc10 = fitur10.zc;
zc11 = fitur11.zc;
zc12 = fitur12.zc;
zc13 = fitur13.zc;
zc14 = fitur14.zc;
zc15 = fitur15.zc;
zc16 = fitur16.zc;
zc17 = fitur17.zc;
zc18 = fitur18.zc;

theta = fitur.theta;
theta2 = fitur2.theta;
theta3 = fitur3.theta;
theta4 = fitur4.theta;
theta5 = fitur5.theta;
theta6 = fitur6.theta;
theta7 = fitur7.theta;
theta8 = fitur8.theta;
theta9 = fitur9.theta;
theta10 = fitur10.theta;
theta11 = fitur11.theta;
theta12 = fitur12.theta;
theta13 = fitur13.theta;
theta14 = fitur14.theta;
theta15 = fitur15.theta;
theta16 = fitur16.theta;
theta17 = fitur17.theta;
theta18 = fitur18.theta;

ts = fitur.ts;
fig1 = plotme(ts, iemg, zc, theta, '1.png');
fig2 = plotme(ts, iemg2, zc2, theta2, '2.png');
fig3 = plotme(ts, iemg3, zc3, theta3, '3.png');
fig4 = plotme(ts, iemg4, zc4, theta4, '4.png');
fig5 = plotme(ts, iemg5, zc5, theta5, '5.png');
fig6 = plotme(ts, iemg6, zc6, theta6, '6.png');
fig7 = plotme(ts, iemg7, zc7, theta7, '7.png');
fig8 = plotme(ts, iemg8, zc8, theta8, '8.png');
fig9 = plotme(ts, iemg9, zc9, theta9, '9.png');
fig10 = plotme(ts, iemg10, zc10, theta10, '10.png');
fig11 = plotme(ts, iemg11, zc11, theta11, '11.png');
fig12 = plotme(ts, iemg12, zc12, theta12, '12.png');
fig13 = plotme(ts, iemg13, zc13, theta13, '13.png');
fig14 = plotme(ts, iemg14, zc14, theta14, '14.png');
fig15 = plotme(ts, iemg15, zc15, theta15, '15.png');
fig16 = plotme(ts, iemg16, zc16, theta16, '16.png');
fig17 = plotme(ts, iemg17, zc17, theta17, '17.png');
fig18 = plotme(ts, iemg18, zc18, theta18, '18.png');

Preapare input output for NARX model
% ============================================
[U, Y] = to_ton(iemg, zc, theta);
[U2, Y2] = to_ton(iemg2, zc2, theta2);
[U3, Y3] = to_ton(iemg3, zc3, theta3);
[U4, Y4] = to_ton(iemg4, zc4, theta4);
[U5, Y5] = to_ton(iemg5, zc5, theta5);
[U6, Y6] = to_ton(iemg6, zc6, theta6);
[U7, Y7] = to_ton(iemg7, zc7, theta7);
[U8, Y8] = to_ton(iemg8, zc8, theta8);
[U10, Y10] = to_ton(iemg10, zc10, theta10);
[U11, Y11] = to_ton(iemg11, zc11, theta11);
[U12, Y12] = to_ton(iemg12, zc12, theta12);
[U13, Y13] = to_ton(iemg13, zc13, theta13);
[U14, Y14] = to_ton(iemg14, zc14, theta14);
[U15, Y15] = to_ton(iemg15, zc15, theta15);
[U16, Y16] = to_ton(iemg16, zc16, theta16);
[U17, Y17] = to_ton(iemg17, zc17, theta17);
[U18, Y18] = to_ton(iemg18, zc18, theta18);

prepare the NARX model
input_delay = 1:3; %
feed_delay = 1:3; %
hiden = 10;
trainfcn = 'trainlm';
net = narxnet(input_delay, feed_delay, hiden, 'open', trainfcn);

Prepare the data for Training and simulation
[x, xi, ai, t] = preparets(net, U, {}, Y);
[x2, xi2, ai2, t2] = preparets(net, U2, {}, Y2);
[x3, xi3, ai3, t3] = preparets(net, U3, {}, Y3);
[x4, xi4, ai4, t4] = preparets(net, U4, {}, Y4);
[x5, xi5, ai5, t5] = preparets(net, U5, {}, Y5);
[x6, xi6, ai6, t6] = preparets(net, U6, {}, Y6);
[x7, xi7, ai7, t7] = preparets(net, U7, {}, Y7);
[x8, xi8, ai8, t8] = preparets(net, U8, {}, Y8);
[x10, xi10, ai10, t10] = preparets(net, U10, {}, Y10);
[x11, xi11, ai11, t11] = preparets(net, U11, {}, Y11);
[x12, xi12, ai12, t12] = preparets(net, U12, {}, Y12);
[x13, xi13, ai13, t13] = preparets(net, U13, {}, Y13);
[x14, xi14, ai14, t14] = preparets(net, U14, {}, Y14);
[x15, xi15, ai15, t15] = preparets(net, U15, {}, Y15);
[x16, xi16, ai16, t16] = preparets(net, U16, {}, Y16);
[x17, xi17, ai17, t17] = preparets(net, U17, {}, Y17);
% [x18, xi18, ai18, t18] = preparets(net, U18, {}, Y18);
% set division of training data
net.divideParam.trainRatio = 70/100;
net.divideparam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
net.trainParam.showWindow = 0;

% train the network
[net, tr] = train(net, x, t, xi, ai);
[net, tr] = train(net, x2, t2, xi2, ai2);
[net, tr] = train(net, x3, t3, xi3, ai3);
[net, tr] = train(net, x4, t4, xi4, ai4);
[net, tr] = train(net, x5, t5, xi5, ai5);
[net, tr] = train(net, x6, t6, xi6, ai6);
[net, tr] = train(net, x7, t7, xi7, ai7);
[net, tr] = train(net, x8, t8, xi8, ai8);
[net, tr] = train(net, x10, t10, xi10, ai10);
[net, tr] = train(net, x11, t11, xi11, ai11);
[net, tr] = train(net, x12, t12, xi12, ai12);
[net, tr] = train(net, x13, t13, xi13, ai13);
[net, tr] = train(net, x14, t14, xi14, ai14);
[net, tr] = train(net, x15, t15, xi15, ai15);
[net, tr] = train(net, x16, t16, xi16, ai16);
[net, tr] = train(net, x17, t17, xi17, ai17);
%[net, tr] = train(net, x18, t18, xi18, ai18);

% test the network
net = closeloop(net);
[x, xi, ai, t] = preparets(net, U, {}, Y);
[x2, xi2, ai2, t2] = preparets(net, U2, {}, Y2);
[x3, xi3, ai3, t3] = preparets(net, U3, {}, Y3);
[x4, xi4, ai4, t4] = preparets(net, U4, {}, Y4);
[x5, xi5, ai5, t5] = preparets(net, U5, {}, Y5);
[x6, xi6, ai6, t6] = preparets(net, U6, {}, Y6);
[x7, xi7, ai7, t7] = preparets(net, U7, {}, Y7);
[x8, xi8, ai8, t8] = preparets(net, U8, {}, Y8);
[x10, xi10, ai10, t10] = preparets(net, U10, {}, Y10);
[x11, xi11, ai11, t11] = preparets(net, U11, {}, Y11);
[x12, xi12, ai12, t12] = preparets(net, U12, {}, Y12);
[x13, xi13, ai13, t13] = preparets(net, U13, {}, Y13);
[x14, xi14, ai14, t14] = preparets(net, U14, {}, Y14);
[x15, xi15, ai15, t15] = preparets(net, U15, {}, Y15);
[x16, xi16, ai16, t16] = preparets(net, U16, {}, Y16);
[x17, xi17, ai17, t17] = preparets(net, U17, {}, Y17);

[net, tr] = train(net, x, t, xi, ai);
[net, tr] = train(net, x2, t2, xi2, ai2);
[net, tr] = train(net, x3, t3, xi3, ai3);
[net, tr] = train(net, x4, t4, xi4, ai4);
[net, tr] = train(net, x5, t5, xi5, ai5);
[net, tr] = train(net, x6, t6, xi6, ai6);
[net, tr] = train(net, x7, t7, xi7, ai7);
[net, tr] = train(net, x8, t8, xi8, ai8);
[net, tr] = train(net, x10, t10, xi10, ai10);
[net, tr] = train(net, x11, t11, xi11, ai11);
[net, tr] = train(net, x12, t12, xi12, ai12);
[net, tr] = train(net, x13, t13, xi13, ai13);
[net, tr] = train(net, x14, t14, xi14, ai14);
[net, tr] = train(net, x15, t15, xi15, ai15);
[net, tr] = train(net, x16, t16, xi16, ai16);
[net, tr] = train(net, x17, t17, xi17, ai17);
% [net, tr] = train(net, x18, t18, xi18, ai18);

[x18, xi18, ai18, t18] = preparets(net, U18, {}, Y18);
y = net(x18, xi18, ai18);
e = gsubtract(t, y);
fit = nrmse(y, Y);
fit.fit
plot(fit.y)
hold on, plot(fit.yhat); title '3 - 18 s'
legend('measured', 'predicted');
hold off,
toc
Local function

function fig = plotme(ts, iemg, zc, theta, figname)
    fig = figure;
    plot(ts, iemg, 'k');
    % xticks(ts); xlim([0 3]);
    hold on, 
    plot(ts, zc, 'b');
    % xticks(ts); xlim([0 3]);
    plot(ts, theta, 'g');
    % xticks(ts); xlim([0 3]);
    title(figname);
    legend('IEMG', 'ZC', '\theta');
    hold off,
    saveas(fig, figname, 'png');
    % clear 'fig';
    %clf;
end

% convert to tonndata
function [U, Y] = to_ton(iemg, zc, theta)
    exog = [iemg, zc];
    target = theta;
    U = tonndata(exog, false, false);
    Y = tonndata(target, false, false);
end
