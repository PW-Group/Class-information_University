clc;clear all;close all;

n1 = -0.1:0.1/5:0.1;  % 設定輸入 x[n] 時間軸
%x = (1/2).^n1; % 獲取輸入 x[n]  之值

fs = 5;
i = 1;
for t = -0.1:0.1/fs:0.1
  if (t >=-1) &&  (t <= 1) 
      x(i) = 0.1-abs(t); %abs(t) 為t絕對值
  else x(i) = 0;
  end
  i = i+1;
end
%t = -1:1/fs:1;
%plot(t,x);

n2=3.3:0.1/5:9.3;   % 設定輸入 h[n] 時間軸
h = [ones(1,1), zeros(1,299), ones(1,1)]; % 設定 h =[0,0,1,1,1,1,1,0,0,0]
y = conv(h,x); % 執行摺積 y[n] = x[n]*h[n] 

len = length(n1)+length(n2)-1; % 摺積 y[n] 之長度 
start = n1(1)+n2(1);  % 計算開始摺積之時間點 
%stop = n1(1)+n2(1) + len-1;  % 計算結束摺積之時間點 
stop =(9.4/3.2)*(start);

n3 = start:6.2/(len-1):stop; 
%n3 = -10:1/5:10; 

subplot(3,1,1); 
stem(n1,x);  % 畫出 x[n] 訊號圖
xlabel('x[n]');
%xlim([start-1, stop+1]);
xlim([-1,1]); %改變y軸上顯示之範圍

subplot(3,1,2);
stem(n2,h); % 畫出 h[n] 訊號圖
%xlim([start-1, stop+1]);
xlabel('h[n]');
xlim([2,10]); %改變x軸上顯示之範圍

subplot(3,1,3); 
stem(n3, y);    % 畫出 y[n] 訊號圖
xlim([start-1, stop+1]);
xlabel('y[n] = x[n]*h[n]');
%xlim([-20,20]); %改變x軸上顯示之範圍


% x2 = [x, zeros(1,length(h)-1)]; %附上 length(h)-1 個零點，以下過程才能獲正確結果 
% h2 = [h, zeros(1,length(x)-1)]; %附上 length(x)-1 個零點，以下過程才能獲正確結果 
% X2 = fft(x2,128); %以128點做為計算fft之基礎
% H2 = fft(h2,128); %以128點做為計算fft之基礎
% Y2 = X2 .* H2;  %頻域中相乘 = 時域中摺積 
% y2 = ifft(Y2,128); %反傅立葉轉換
% subplot(4,1,4); 
% stem(start:128-abs(start)-1, y2);    % 畫出 y1[n] 訊號圖
% xlim([start-1, stop+1]);
% xlabel('y2[n] = ifft( fft(x[n])*fft(h[n]) )');
