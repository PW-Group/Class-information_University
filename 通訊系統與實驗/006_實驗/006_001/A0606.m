clear all,close all,clc
for  ii=1:100
n = 200; % 每一秒產生200個點
bits = [ 0 1 0 1 1 0 0 1 0 0]; % 訊息
bitrate = 1; % 位元率 = 1 bit per second
[t,s] = unrz(bits,bitrate);  % 產生訊號波形 Unipolar NRZ s(t), 訊號時間長度 Tb = 1 sec 
[t2,s1]= unrz(1, bitrate); % s1(t) = 1, 訊號時間長度 Tb = 1 sec, 
h = fliplr(s1);  % 匹配濾波器 h(t) = s1(Tb - t)
noise = wgn(1, length(s), 20); %相加性白色高斯雜訊， 例如 10dBW = 10*log10, 0dbW = 10*log10^0, -10dbW =  10*log10^-1
y = s + noise;                %此處 log 以10為底 

for i=1:1:length(bits)
 integral = conv(h, y((i-1)*n+1 : i*n));  % 匹配濾波器作用 : 積分(累加訊號能量)與除去雜訊
 if( i == 1 ) v = integral(1:n);    %為配合後級的判決，僅取匹配濾波器輸出結果的一半波形
 else v = [v integral(1:n)];        %結合前次的輸出結果一半波形，產生新的輸出波形
 end
end
vq = v/n;        %正規化

threshold = 0.5;  % 門檻值
vb = zeros(1,length(bits)+1);
for i = 2:length(bits)+1;       
    if(vq((i-1)*n) > threshold) vb(i) = 1;  %經與門檻值比較後，重建訊息
    else vb(i) = 0;
    end
end
 [t4,s4] = unrz(vb,bitrate); %為與原訊號 s 比較，重建訊號為 s4 
aa1=s(1,1);aa2=s(1,n+1);aa3=s(1,2*n+1);aa4=s(3*n+1);aa5=s(4*n+1);aa6=s(5*n+1);aa7=s(6*n+1);aa8=s(7*n+1);aa9=s(8*n+1);aa10=s(9*n+1);                  %位於(1~10)的輸入值
ss1=s4(1,n+1);ss2=s4(1,2*n+1);ss3=s4(3*n+1);ss4=s4(4*n+1);ss5=s4(5*n+1);ss6=s4(6*n+1);ss7=s4(7*n+1);ss8=s4(8*n+1);ss9=s4(9*n+1);ss10=s4(10*n+1);     %位於(1~10)的輸出值
input=[aa1 aa2 aa3 aa4 aa5 aa6 aa7 aa8 aa9 aa10];
output=[ss1 ss2 ss3 ss4 ss5 ss6 ss7 ss8 ss9 ss10];
Subtraction=abs([input-output]);
Sum=sum(Subtraction);
SUM=Sum/10;
c{ii}=SUM;
end
save c;
cc=cell2mat(c);
summm=sum(cc)
ansssss=summm/100






