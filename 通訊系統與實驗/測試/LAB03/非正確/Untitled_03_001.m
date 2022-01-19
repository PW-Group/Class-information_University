clc;clear all;close all;
%n1 = -1:1:1;  % 設定輸入 x[n] 時間軸
%x = (1/2).^n1; % 獲取輸入 x[n]  之值

%線性組合
%fs = 10e3;   %10kHz 取樣頻率
fs = 5;
i = 1;
for t = -2:1/fs:2
  if (t >=-1) &&  (t <= 1) 
      x(i) = 1-abs(t); %abs(t) 為t絕對值
  else x(i) = 0;
  end
  i = i+1;
end
t = -2:1/fs:2;
n1 = -10:1:10;


n2=-10:1:10;   % 設定輸入 h[n] 時間軸
h = [ones(1,1), zeros(1,19),ones(1,1)];    %設定 x2=[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1];
y = conv(h,x); % 執行摺積 y[n] = x[n]*h[n] 

len = length(n1)+length(n2)-1; % 摺積 y[n] 之長度 
start = n1(1)+n2(1);  % 計算開始摺積之時間點 
stop = n1(1)+n2(1) + len-1;  % 計算結束摺積之時間點 
n3 = start:1:stop; 

subplot(4,1,1); 
stem(t,x);  % 畫出 x[n] 訊號圖
xlabel('x[n]');
xlim([start-1, stop+1]);

subplot(4,1,2);
stem(n2,h); % 畫出 h[n] 訊號圖
xlim([start-1, stop+1]);
xlabel('h[n]');

subplot(4,1,3); 
stem(n3, y);    % 畫出 y[n] 訊號圖
xlim([start-1, stop+1]);
xlabel('y[n] = x[n]*h[n]');

x2 = [x, zeros(1,length(h)-1)]; %附上 length(h)-1 個零點，以下過程才能獲正確結果 
h2 = [h, zeros(1,length(x)-1)]; %附上 length(x)-1 個零點，以下過程才能獲正確結果 
X2 = fft(x2,128); %以128點做為計算fft之基礎
H2 = fft(h2,128); %以128點做為計算fft之基礎
Y2 = X2 .* H2;  %頻域中相乘 = 時域中摺積 
y2 = ifft(Y2,128); %反傅立葉轉換
subplot(4,1,4); 
stem(start:128-abs(start)-1, y2);    % 畫出 y1[n] 訊號圖
xlim([start-1, stop+1]);
xlabel('y2[n] = ifft( fft(x[n])*fft(h[n]) )');
