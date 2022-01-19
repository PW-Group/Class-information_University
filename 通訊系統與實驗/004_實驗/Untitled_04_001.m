clc;clear all;close all;

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
subplot(6,1,1);
plot(t,x);
xlim([0, 5]); %改變x軸上顯示之範圍
title('原訊號 x(t)');
X = fftshift(fft(x));
subplot(6,1,2);
M = length(x);
freq = (10*fc/M)*(-M/2:M/2-1);	% 頻域的頻率刻度
plot(freq,abs(X)/M);
title('原訊號的FFT X(f)');

subplot(6,1,3);
stem(ts,xn);
xlim([0, 5]); %改變x軸上顯示之範圍
title('取樣後訊號 x(nt)');
X1 =fftshift(fft(xn));
freq1 = freqStep*(-N/2:N/2-1);	% 頻域的頻率刻度
subplot(6,1,4);
plot(freq1,abs(X1)/N);
title('取樣後訊號的FFT Xn(f)'); 

subplot(6,1,5);
stem(ts,quants);
xlim([0, 5]); %改變x軸上顯示之範圍
title('量化後訊號  v(nt)');
X2 = fftshift(fft(quants));
subplot(6,1,6);
plot(freq1,abs(X2)/N);
title('量化後訊號的FFT Vn(f)');