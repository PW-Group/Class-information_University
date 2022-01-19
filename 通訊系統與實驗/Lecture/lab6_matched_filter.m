% 本實驗用於體現 匹配濾波器
% 訊號波形 Unipolar NRZ s(t) : bit = 1 and s1(t) = 1,  bit = 0 and s2(t) = 0; 訊號時間長度 Tb = 1 sec
% 匹配濾波器 h(t) = s1(Tb - t)

clf;
n = 200; % 每一秒產生200個點
bits = [ 0 1 0 1 1 0 0 1 0 0]; % 訊息
bitrate = 1; % 位元率 = 1 bit per second
[t,s] = unrz(bits,bitrate);  % 產生訊號波形 Unipolar NRZ s(t), 訊號時間長度 Tb = 1 sec 
[t2,s1]= unrz(1, bitrate); % s1(t) = 1, 訊號時間長度 Tb = 1 sec, 
h = fliplr(s1);  % 匹配濾波器 h(t) = s1(Tb - t)

subplot(5,1,1);
plot(t,s,'LineWidth',3);
axis([0 t(end)+2 -0.1 1.1]);
title('Transmited bits = [ 0 1 0 1 1 0 0 1 0 0], 0<=t<=1 s1(t)=1 as bit = 1 and s2(t)=0 as bit = 0 ');
grid on;

subplot(5,1,2);
plot(t2,h,'LineWidth',3);
axis([0 t(end)+2 -0.1 1.1]);
title('Matched filter h(t) = s1(Tb-t), Tb =1 sec');
grid on;

noise = wgn(1, length(s), 0); %相加性白色高斯雜訊， 例如 10dBW = 10*log10, 0dbW = 10*log10^0, -10dbW =  10*log10^-1
y = s + noise;                %此處 log 以10為底 
subplot(5,1,3);
plot(t,y,'LineWidth',1);
title('Received signal y(t) = s(t)+ noise, as noise power spectrum desnity with 10 dBW');
axis([0 t(end)+2 -1.5 1.5]);

for i=1:1:length(bits)
 integral = conv(h, y((i-1)*n+1 : i*n));  % 匹配濾波器作用 : 積分(累加訊號能量)與除去雜訊
 if( i == 1 ) v = integral(1:n);    %為配合後級的判決，僅取匹配濾波器輸出結果的一半波形
 else v = [v integral(1:n)];        %結合前次的輸出結果一半波形，產生新的輸出波形
 end
end

vq = v/n;        %正規化
subplot(5,1,4);
plot(t,vq,'LineWidth',3);
title('Output of matched filter, threshold = 0.5');
axis([0 t(end)+2 -0.5 1.5]);
hold on
threshold_line = 0.5*ones(1, length(vq)); %畫門檻值之線
plot(t,threshold_line,'r');
hold off

threshold = 0.5;  % 門檻值
vb = zeros(1,length(bits)+1);
for i = 2:length(bits)+1;       
    if(vq((i-1)*n) > threshold) vb(i) = 1;  %經與門檻值比較後，重建訊息
    else vb(i) = 0;
    end
end
subplot(5,1,5);
[t4,s4] = unrz(vb,bitrate); %為與原訊號 s 比較，重建訊號為 s4 
plot(t4,s4,'red','LineWidth',3);
title('Received bits');
axis([0 t4(end)+1 -0.1 1.1]);

