clc;clear all;close all;

%線性組合
clear; 
%fs = 10e3;   %10kHz 取樣頻率
fs = 100;
i = 1;
for t = -3 :1/fs: 4
  if (t >=-2) &&  (t <=-1) 
      x(i) = 2*sin(2*pi*t);
  elseif (t>2) && (t<= 3) 
      x(i) = -sin(2*pi*t);
  else x(i) = 0;
  end
  i = i+1;
end
t = -3:1/fs:4;
y = x;
plot(t,y);
xlabel('時間'); % x 軸說明
ylabel('數值'); % y 軸說明
title('訊號圖'); %; 圖上方說明
legend('非週期正弦波之組合'); %圖內說明;
ylim([-2,2]); %改變y軸上顯示之範圍
grid on