clc;clear all;close all;

t=-15:0.001:15;
Sa=sinc(t/pi); %Sa��ƪ�����
subplot(211);
plot(t,Sa); %�b�]-15,15�^�϶����c�ySa��ƹϹ�
xlabel('t');
ylabel('Sa�]t�^');
title('�b�϶��]-15�A15�^���c��Sa(t)���');
grid on;
%�U���O�Q�n��{��sinc��ƪ��ť߸��ܴ��åB�c��
subplot(212);
Fa=log(1+abs(fftshift(fft(Sa))));  %��Sa ��ƶi��ť߸��ܴ�
plot(Fa); %�b�]-3,3�^���c�y�W�й�
xlabel('w');
ylabel('Fa�]t�^');
title('Sa(t)���W�Ш��');
grid on;