clc;clear all;close all;
% lab02-1
% ���d�Үi��²�楿���i���ť߸��ഫ�A�H�����W�Ш����
% �����i���W�v�ꥩ�O freqStep ����ƭ��A�ҥH�����W�����ӥu����ӫD�s�I
% �Y���i���W�v���O freqStep ����ƭ��A�ҥH�����W�з|�u���}�v(Smearing)

N = 256;			% �I��
fs = 8000;			% �����W�v
freqStep = fs/N;		% �W�쪺�W�v���ѪR��
f = 10*freqStep;		% �����i���W�v�A��O freqStep ����ƭ�
time = (0:N-1)/fs;		% �ɰ쪺�ɶ����
y = cos(2*pi*f*time);		% Signal to analyze
Y = 2*fft(y);			% Spectrum
freq = freqStep*(0:N/2);	% �W�쪺�W�v���
Y = Y(1:length(freq));



% Plot time data
subplot(3,1,1);
plot(time, y, '.-');
title('Sinusoidal signals');
xlabel('Time (seconds)'); ylabel('Amplitude');
axis tight

% Plot spectral magnitude
subplot(3,1,2);
%plot(freq, abs(Y), '.-b'); grid on
stem(freq, abs(Y)); grid on
xlabel('Frequency)'); 
ylabel('Magnitude (Linear)');

% Plot phase
subplot(3,1,3);
plot(freq, angle(Y), '.-b'); grid on
xlabel('Frequency)'); 
ylabel('Phase (Radian)');