% ������Ω���{ �ǰt�o�i��
% �T���i�� Unipolar NRZ s(t) : bit = 1 and s1(t) = 1,  bit = 0 and s2(t) = 0; �T���ɶ����� Tb = 1 sec
% �ǰt�o�i�� h(t) = s1(Tb - t)

clf;
n = 200; % �C�@����200���I
bits = [ 0 1 0 1 1 0 0 1 0 0]; % �T��
bitrate = 1; % �줸�v = 1 bit per second
[t,s] = unrz(bits,bitrate);  % ���ͰT���i�� Unipolar NRZ s(t), �T���ɶ����� Tb = 1 sec 
[t2,s1]= unrz(1, bitrate); % s1(t) = 1, �T���ɶ����� Tb = 1 sec, 
h = fliplr(s1);  % �ǰt�o�i�� h(t) = s1(Tb - t)

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

noise = wgn(1, length(s), 0); %�ۥ[�ʥզⰪ�����T�A �Ҧp 10dBW = 10*log10, 0dbW = 10*log10^0, -10dbW =  10*log10^-1
y = s + noise;                %���B log �H10���� 
subplot(5,1,3);
plot(t,y,'LineWidth',1);
title('Received signal y(t) = s(t)+ noise, as noise power spectrum desnity with 10 dBW');
axis([0 t(end)+2 -1.5 1.5]);

for i=1:1:length(bits)
 integral = conv(h, y((i-1)*n+1 : i*n));  % �ǰt�o�i���@�� : �n��(�֥[�T����q)�P���h���T
 if( i == 1 ) v = integral(1:n);    %���t�X��Ū��P�M�A�Ȩ��ǰt�o�i����X���G���@�b�i��
 else v = [v integral(1:n)];        %���X�e������X���G�@�b�i�ΡA���ͷs����X�i��
 end
end

vq = v/n;        %���W��
subplot(5,1,4);
plot(t,vq,'LineWidth',3);
title('Output of matched filter, threshold = 0.5');
axis([0 t(end)+2 -0.5 1.5]);
hold on
threshold_line = 0.5*ones(1, length(vq)); %�e���e�Ȥ��u
plot(t,threshold_line,'r');
hold off

threshold = 0.5;  % ���e��
vb = zeros(1,length(bits)+1);
for i = 2:length(bits)+1;       
    if(vq((i-1)*n) > threshold) vb(i) = 1;  %�g�P���e�Ȥ����A���ذT��
    else vb(i) = 0;
    end
end
subplot(5,1,5);
[t4,s4] = unrz(vb,bitrate); %���P��T�� s ����A���ذT���� s4 
plot(t4,s4,'red','LineWidth',3);
title('Received bits');
axis([0 t4(end)+1 -0.1 1.1]);

