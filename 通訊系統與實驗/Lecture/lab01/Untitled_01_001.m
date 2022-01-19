clc;clear all;close all;

%線性組合
clear; 
%fs = 10e3;   %10kHz 取樣頻率
fs = 100;
i = 1;
for t = 1:1/fs:3
  if (t >=8/5) &&  (t <=2) 
      x(i) = 5*t-8;
  elseif (t>2) && (t<= 11/5) 
      x(i) = 2;
  elseif (t>11/5) && (t<= 13/5) 
      x(i) = 2-2*cos(2.5*pi*t);
  elseif (t>13/5) && (t<= 14/5)
      x(i) = 2;
  else x(i) = 0;
  end
  i = i+1;
end
t = 1:1/fs:3;
y = x-2;
plot(t,y);
xlabel('時間'); % x 軸說明
ylabel('數值'); % y 軸說明
title('訊號圖'); %; 圖上方說明
legend('線性組合'); %圖內說明;
ylim([-2.5,0.5]); %改變y軸上顯示之範圍