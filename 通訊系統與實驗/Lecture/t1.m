% Lab4_hw#1
clc
close all
clear all
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
plot(t,x);
xlim([0, 5]); %����x�b�W��ܤ��d��
ylim([-1.1, 1.1]); %����x�b�W��ܤ��d��
title('��T�� x(t)');