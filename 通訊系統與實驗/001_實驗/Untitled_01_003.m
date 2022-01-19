clc;clear all;close all;

%線性組合
clear; 
%fs = 10e3;   %10kHz 取樣頻率
fs = 100;
i = 1;
for t = -10:1/fs:40
  if (t >=-8) &&  (t <= 0) 
      x(i) = 2*(t^2)+2;
  elseif (t>0) && (t<= 2) 
      x(i) = 2;
  elseif (t>2) && (t<= 18) 
      x(i) = 2+2*cos(pi*(t^2));
  elseif (t>18) && (t<= 32)
      x(i) = 2;
  else x(i) = 0;
  end
  i = i+1;
end
t = -10:1/fs:40;
plot(t,x);
xlabel('時間'); % x 軸說明
ylabel('數值'); % y 軸說明
title('訊號圖'); %; 圖上方說明
legend('線性組合'); %圖內說明;
ylim([-5,150]); %改變y軸上顯示之範圍