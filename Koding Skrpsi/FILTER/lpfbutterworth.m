%==============================================
%Program Design Filter Digital Low Pass IIR
%Mata kuliah : Pengolahan Signal Digital Lanjut 
%Oleh : Miftahul Huda
%NRP : 2200.203.008
%Dosen : Ir. Suwadi, MT
%==============================================

clear all; %Menghapus semua data
clf; %Membersihkan gambar

%Koefisien filter
B=[0.0674 0.1349 0.0674];A=[1 -1.1430 0.4128];
%B=[1 2 1];A=[14.8261 -16.9466 6.1205];
[H,wH]=freqz(B,A,100);

argument=atan2(imag(H),real(H));

%masukan impuls
x1=zeros(1,200);
x1(1)=1;

%Mencari respons impuls dengan menggunakan persamaan beda dan masukan impuls
for n=1:200;
   if n==1
      y(n)=0.0674*x1(n);
   elseif n ==2
      y(n)=0.0674*x1(n)+0.1349*x1(n-1)+1.1430*y(n-1);
   elseif n >=2
      y(n)=0.0674*x1(n)+0.1349*x1(n-1)+0.0674*x1(n-2)+1.1430*y(n-1)-0.4128*y(n-2);
   end
   h(n)=y(n);
end

%Sinyal masukan
% Fs=10000;%Sampling Sinyal masukan
% t=(1:300)/Fs;
% x=sin(2*pi*100*t)+sin(2*pi*3000*t);
% X=fft(x,512);%Transformasi Fourier untuk melihat spektrum sinyal masukan
% w=(0:255)/256*Fs/2;

addpath('Z:\UNAIR\STUDY\SKRIPSI\DATA\DATA_odi2kg_(6)2019_10_1_2999');
load('part3.mat');
Fs=10000;
t=part3(:,1);
x=part3(:,3);
X=fft(x,512);
w=(0:255)/256*Fs/2;

%Proses pemfilteran dengan menggunakan persamaan beda
for n= 1:200;
   if n==1;
      y(n)=0.0674*x(n);
   elseif n==2;
      y(n)=0.0674*x(n)+0.1349*x(n-1)+1.1430*y(n-1);
   elseif n>=3;
      y(n)=0.0674*x(n)+0.1349*x(n-1)+0.0674*x(n-2)+1.1430*y(n-1)-0.4128*y(n-2);
   end
end


Y=fft(y,512);%transformasi Fourier sinyal keluaran untuk melihat spektrum sinyal keluaran

%Gambar respons magnitudo
figure(1)
plot(wH,abs(H.*conj(H)));
title('Respon Magnitudo Kuadrat Filter Hasil Rancangan')
xlabel('Frekuensi (Radian)')
ylabel('Magnitudo Kuadrat,|H|^2')
axis([0 3.2 0 1])
grid on

%Gambar respons magnitudo
figure(2)
plot(wH,20*log10(abs(H)))
title('Respon Magnitudo Filter Hasil Rancangan (Skala dB)')
xlabel('Frekuensi (Radian)')
ylabel('Magnitudo 20*log|H|')
axis([0 3.2 -90 0])
grid on

%Gambar respons phase
figure(3)
plot(wH,argument);
title('Respon Phase Filter Hasil Rancangan')
xlabel('Frekuensi (Radian)')
ylabel('Phase (Radian)')
axis([0 3.2 -3.14 3.14])
grid on

%Gambar respons impuls
figure(4)
%stem(h(1:40));
stem((0:39),h(1:40))
title('Respons Impuls Filter Hasil Rancangan')
xlabel('n')
ylabel('h(n)')
grid on

%Gambar sinyal masukan domain waktu
figure(5)
plot(t,x);
title('Sinyal Masukan')
xlabel('Waktu, t(detik)')
ylabel('Level Sinyal, x(t)')
axis([0 0.02 -2 2])
grid on

%Gambar sinyal masukan domain frekuensi
figure(6)
plot(w,abs(X(1:256)))
title('Spektrum Sinyal Masukan')
xlabel('Frekuensi (Hz)')
ylabel('Level Sinyal, X(f)')
grid on

%Gambar sinyal masukan tersampling
figure(7)
stem(x(1:200));
title('Sinyal Masukan Tersampling')
xlabel('Sampling ke n')
ylabel('Level Sinyal, x(n)')
%axis([0 0.04 -2 2])
grid on

%Gambar sinyal masukan X(ejw)
figure(8)
plot(w/Fs,abs(X(1:256)))
title('Spektrum Sinyal Masukan')
xlabel('Frekuensi (Radian)')
ylabel('Level Sinyal, X(f)')
grid on

%Gambar sinyal keluaran diskrit
figure(9)
stem(y(1:200));
title('Sinyal Keluaran')
xlabel('Samplin ke n')
ylabel('Level Sinyal, y(n)')
%axis([0 0.028 -1.5 1.5])
grid on

%Gambar sinyal keluaran Y(ejw)
figure(10)
plot(w*2*pi/Fs,abs(Y(1:256)))
title('Spektrum Sinyal Keluaran')
xlabel('Frekuensi (Radian)')
ylabel('Level Sinyal, X(f)')
grid on

%Gambar sinyal keluaran domain waktu
figure(11)
plot(t(1:200),y(1:200));
title('Sinyal Keluaran')
xlabel('Waktu, t(detik)')
ylabel('Level Sinyal, y(t)')
axis([0 0.02 -1.5 1.5])
grid on

%Gambar sinyal keluaran domain frekuensi
figure(12)
plot(w,abs(Y(1:256)))
title('Spektrum Sinyal Keluaran')
xlabel('Frekuensi (Hz)')
ylabel('Level Sinyal, X(f)')
grid on
