close all; clear all;
N=250; Ts=1;
a=[1 -0.5 0.7]; b=[0 1 0.5]; c=[1 -1 0.2];
Au=[1 -0.1 -0.12]; Bu=[0 1 0.2]; Mu=idpoly(Au,Bu,Ts);
u=sim(Mu,randn(2*N,1)); %u is ARMA process
noise_var=1; e=randn(2*N,1);
M=idpoly(a,b,c,1,1,noise_var,Ts);
y=sim(M,[u e]);
uv=u(N+1:end); ev=e(1+1:end); yv=y(N+1:end);
u=u(1:N); e=e(1:N); y=y(1:N);
DATe=iddata(y,u,Ts); DATv=iddata(yv,uv,Ts);

%%identification
na=2;nb=3;nc=2;
theta_iv=iv4(DATe,[na nb 1]); %ARX using iv4
theta_ls=arx(DATe,[na nb 1]); %ARX using LS

%compare the measured output and the model output
[yhat2,fit2]=compare(DATv,theta_iv);
[yhat4,fit4]=compare(DATv,theta_ls);

figure;t=1:N;
plot(t,yhat2{1}.y(t),'--',t,yhat4{1}.y(t),'-.',t,yv(t));
legend('model (iv)','model (LS) ','measured')
title('Comparison on validation data set','FontSize',16);