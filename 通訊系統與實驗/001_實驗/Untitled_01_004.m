clc;clear all;close all;

%線性組合
clear; 
%fs = 10e3;   %10kHz 取樣頻率
fs = 100;
i = 1;
for t = -5:1/fs:5
  if (t >=-1) &&  (t <= 1) 
      x(i) = 1-abs(t); %abs(t) 為t絕對值
  else x(i) = 0;
  end
  i = i+1;
end
t = -5:1/fs:5;
plot(t,x);
xlabel('時間'); % x 軸說明
ylabel('數值'); % y 軸說明
title('訊號圖'); %; 圖上方說明
legend('線性組合'); %圖內說明;
ylim([0,2]); %改變y軸上顯示之範圍