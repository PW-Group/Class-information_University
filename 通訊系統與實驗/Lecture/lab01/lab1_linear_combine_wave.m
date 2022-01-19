%線性組合
clear; 
%fs = 10e3;   %10kHz 取樣頻率
fs = 100;
i = 1;
for t = -3:1/fs:5
  if (t >=-2) &&  (t <= 0) 
      x(i) = t+2;
  elseif (t>0) && (t<= 1) 
      x(i) = 2;
  elseif (t>1) && (t<= 3) 
      x(i) = 2+2*cos(0.5*pi*t);
  elseif (t>3) && (t<= 4)
      x(i) = 2;
  else x(i) = 0;
  end
  i = i+1;
end
t = -3:1/fs:5;
plot(t,x);
xlabel('時間'); % x 軸說明
ylabel('數值'); % y 軸說明
title('訊號圖'); %; 圖上方說明
legend('線性組合'); %圖內說明;
ylim([0,3]); %改變y軸上顯示之範圍
