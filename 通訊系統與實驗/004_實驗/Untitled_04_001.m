clc;clear all;close all;

N = 1280;
fs = 5;  %�ļ˲v��niquist�t�v >= 2*�T���W�e
ts = (0:N-1)/fs; %�ļˮɶ��϶�
freqStep = fs/N; % �W�쪺�W�v���ѪR��

c =input('�s�X�줸 = '); %�C��PCM�ȥ� c �Ӧ줸���
level = 2^c ; %�@�p�� 2^c ���h
part = -1: 2/level:1;% ���˾����̧C��-1.0 �P�̰��� 1.0, ���j�ƶq�� 2^c.
codebook = -1.0:2/level:1+2/level;%�q�ƾ��N�Xï�A�q�ƫ᪺�ƭ�-1,-1+2/level,-1+4/level., ... 
fc = 2;    %���ͩ��i,fc = 1Hz
t = (0:N-1)/(100*fc);
x = square(2*pi*fc*t);  %���ͭ�T��
ts = (0:N-1)/fs; %�ļˮɶ��϶�
xn = square(2*pi*fc*ts); %���˫�T��,
[index,quants] = quantiz(xn,part,codebook);% quants �q�ƦV�q�A �Ȭ��B�I��
                                            % index ���h�V�q�A �Ȭ����
subplot(6,1,1);
plot(t,x);
xlim([0, 5]); %����x�b�W��ܤ��d��
title('��T�� x(t)');
X = fftshift(fft(x));
subplot(6,1,2);
M = length(x);
freq = (10*fc/M)*(-M/2:M/2-1);	% �W�쪺�W�v���
plot(freq,abs(X)/M);
title('��T����FFT X(f)');

subplot(6,1,3);
stem(ts,xn);
xlim([0, 5]); %����x�b�W��ܤ��d��
title('���˫�T�� x(nt)');
X1 =fftshift(fft(xn));
freq1 = freqStep*(-N/2:N/2-1);	% �W�쪺�W�v���
subplot(6,1,4);
plot(freq1,abs(X1)/N);
title('���˫�T����FFT Xn(f)'); 

subplot(6,1,5);
stem(ts,quants);
xlim([0, 5]); %����x�b�W��ܤ��d��
title('�q�ƫ�T��  v(nt)');
X2 = fftshift(fft(quants));
subplot(6,1,6);
plot(freq1,abs(X2)/N);
title('�q�ƫ�T����FFT Vn(f)');