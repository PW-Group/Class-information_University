%
% 實驗目的 : 顯示訊號之基本運算，包含漲縮(Signal Stretch and Compression)、
% 平移(shift)、鏡射(Reflection)及其線性組合等

clear;    %清除所有資料如變數圖型等
fs = 10e3;   %10kHz 取樣頻率 
t = -.1:1/fs:0.1; %產生200 ms之時間點， 每點間隔為 1/10kHz，共有2001時間點
w = 40e-3;  %  脈波間距 = 40 ms
x = tripuls(t,w); %產生三角波(-0.1 ~ 0.1, 脈波間距 = 40 ms)
plot(t,x);
xlabel('時間'); % x 軸說明
ylabel('數值'); % y 軸說明
title('訊號圖'); %; 圖上方說明
legend('三角波形'); %圖內說明;
pause;  %暫停

%訊號漲縮
a = 0.6;
y = tripuls(t,w/a); % y(t) = x(at)
plot(t,y);
xlabel('時間'); 
ylabel('數值'); 
title('漲縮訊號圖'); 
legend('y(t)=x(0.6t)'); 
pause;  

%平移
b = 2;
t1 = t-b; % y(t) = x(t+b) 
y1 = x;
plot(t1,y1);
xlabel('時間'); 
ylabel('數值'); 
title('平移訊號圖'); 
legend('y(t)=x(t+2)');
xlim([min(t1), max(t1)]);
pause;  

%鏡射
s = 1; % 歪斜率(skew), -1 <= s <=1
x1 = tripuls(t,w,s);
subplot(2,1,1) %印上圖
plot(t,x1);
xlabel('時間'); 
ylabel('數值'); 
title('原訊號圖'); 
legend('x(t)');
d = max(size(t)); %找出時間 t 的長度
y2 = zeros(size(x));
for i=1:d
    y2(i) = x1(1+d-i); % 前後對調
end
subplot(2,1,2) %印下圖
plot(t,y2);
xlabel('時間'); 
ylabel('數值'); 
title('鏡射訊號圖'); 
legend('y = x(-t)');







