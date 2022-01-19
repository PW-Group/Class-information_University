clear all,close all,clc
for  ii=1:100
n = 200; % �C�@����200���I
bits = [ 0 1 0 1 1 0 0 1 0 0]; % �T��
bitrate = 1; % �줸�v = 1 bit per second
[t,s] = unrz(bits,bitrate);  % ���ͰT���i�� Unipolar NRZ s(t), �T���ɶ����� Tb = 1 sec 
[t2,s1]= unrz(1, bitrate); % s1(t) = 1, �T���ɶ����� Tb = 1 sec, 
h = fliplr(s1);  % �ǰt�o�i�� h(t) = s1(Tb - t)
noise = wgn(1, length(s), 20); %�ۥ[�ʥզⰪ�����T�A �Ҧp 10dBW = 10*log10, 0dbW = 10*log10^0, -10dbW =  10*log10^-1
y = s + noise;                %���B log �H10���� 

for i=1:1:length(bits)
 integral = conv(h, y((i-1)*n+1 : i*n));  % �ǰt�o�i���@�� : �n��(�֥[�T����q)�P���h���T
 if( i == 1 ) v = integral(1:n);    %���t�X��Ū��P�M�A�Ȩ��ǰt�o�i����X���G���@�b�i��
 else v = [v integral(1:n)];        %���X�e������X���G�@�b�i�ΡA���ͷs����X�i��
 end
end
vq = v/n;        %���W��

threshold = 0.5;  % ���e��
vb = zeros(1,length(bits)+1);
for i = 2:length(bits)+1;       
    if(vq((i-1)*n) > threshold) vb(i) = 1;  %�g�P���e�Ȥ����A���ذT��
    else vb(i) = 0;
    end
end
 [t4,s4] = unrz(vb,bitrate); %���P��T�� s ����A���ذT���� s4 
aa1=s(1,1);aa2=s(1,n+1);aa3=s(1,2*n+1);aa4=s(3*n+1);aa5=s(4*n+1);aa6=s(5*n+1);aa7=s(6*n+1);aa8=s(7*n+1);aa9=s(8*n+1);aa10=s(9*n+1);                  %���(1~10)����J��
ss1=s4(1,n+1);ss2=s4(1,2*n+1);ss3=s4(3*n+1);ss4=s4(4*n+1);ss5=s4(5*n+1);ss6=s4(6*n+1);ss7=s4(7*n+1);ss8=s4(8*n+1);ss9=s4(9*n+1);ss10=s4(10*n+1);     %���(1~10)����X��
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






