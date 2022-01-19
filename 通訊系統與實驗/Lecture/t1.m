% Lab4_hw#1
clc
close all
clear all
N = 1280;
fs = 5;  %採樣率為niquist速率 >= 2*訊號頻寬
ts = (0:N-1)/fs; %採樣時間區間
freqStep = fs/N; % 頻域的頻率的解析度

c =input('編碼位元 = '); %每個PCM值由 c 個位元表示
level = 2^c ; %共計有 2^c 階層
part = -1: 2/level:1;% 取樣器的最低值-1.0 與最高值 1.0, 間隔數量為 2^c.
codebook = -1.0:2/level:1+2/level;%量化器代碼簿，量化後的數值-1,-1+2/level,-1+4/level., ... 
fc = 2;    %產生弦波,fc = 1Hz
t = (0:N-1)/(100*fc);
x = square(2*pi*fc*t);  %產生原訊號
ts = (0:N-1)/fs; %採樣時間區間
xn = square(2*pi*fc*ts); %取樣後訊號,
[index,quants] = quantiz(xn,part,codebook);% quants 量化向量， 值為浮點數
                                            % index 階層向量， 值為整數
plot(t,x);
xlim([0, 5]); %改變x軸上顯示之範圍
ylim([-1.1, 1.1]); %改變x軸上顯示之範圍
title('原訊號 x(t)');