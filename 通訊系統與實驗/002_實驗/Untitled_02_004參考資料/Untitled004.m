clc;clear all;close all;

t=-15:0.001:15;
Sa=sinc(t/pi); %Sa函數的原函數
subplot(211);
plot(t,Sa); %在（-15,15）區間內構造Sa函數圖像
xlabel('t');
ylabel('Sa（t）');
title('在區間（-15，15）內構建Sa(t)函數');
grid on;
%下面是想要實現對sinc函數的傅立葉變換並且構圖
subplot(212);
Fa=log(1+abs(fftshift(fft(Sa))));  %對Sa 函數進行傅立葉變換
plot(Fa); %在（-3,3）內構造頻譜圖
xlabel('w');
ylabel('Fa（t）');
title('Sa(t)的頻譜函數');
grid on;