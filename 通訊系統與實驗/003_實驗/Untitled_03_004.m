clc;clear all;close all;

n1 = -0.1:0.1/5:0.1;  % �]�w��J x[n] �ɶ��b
%x = (1/2).^n1; % �����J x[n]  ����

fs = 5;
i = 1;
for t = -0.1:0.1/fs:0.1
  if (t >=-1) &&  (t <= 1) 
      x(i) = 0.1-abs(t); %abs(t) ��t�����
  else x(i) = 0;
  end
  i = i+1;
end
%t = -1:1/fs:1;
%plot(t,x);

n2=3.3:0.1/5:9.3;   % �]�w��J h[n] �ɶ��b
h = [ones(1,1), zeros(1,299), ones(1,1)]; % �]�w h =[0,0,1,1,1,1,1,0,0,0]
y = conv(h,x); % ����P�n y[n] = x[n]*h[n] 

len = length(n1)+length(n2)-1; % �P�n y[n] ������ 
start = n1(1)+n2(1);  % �p��}�l�P�n���ɶ��I 
%stop = n1(1)+n2(1) + len-1;  % �p�⵲���P�n���ɶ��I 
stop =(9.4/3.2)*(start);

n3 = start:6.2/(len-1):stop; 
%n3 = -10:1/5:10; 

subplot(3,1,1); 
stem(n1,x);  % �e�X x[n] �T����
xlabel('x[n]');
%xlim([start-1, stop+1]);
xlim([-1,1]); %����y�b�W��ܤ��d��

subplot(3,1,2);
stem(n2,h); % �e�X h[n] �T����
%xlim([start-1, stop+1]);
xlabel('h[n]');
xlim([2,10]); %����x�b�W��ܤ��d��

subplot(3,1,3); 
stem(n3, y);    % �e�X y[n] �T����
xlim([start-1, stop+1]);
xlabel('y[n] = x[n]*h[n]');
%xlim([-20,20]); %����x�b�W��ܤ��d��


% x2 = [x, zeros(1,length(h)-1)]; %���W length(h)-1 �ӹs�I�A�H�U�L�{�~���򥿽T���G 
% h2 = [h, zeros(1,length(x)-1)]; %���W length(x)-1 �ӹs�I�A�H�U�L�{�~���򥿽T���G 
% X2 = fft(x2,128); %�H128�I�����p��fft����¦
% H2 = fft(h2,128); %�H128�I�����p��fft����¦
% Y2 = X2 .* H2;  %�W�줤�ۭ� = �ɰ줤�P�n 
% y2 = ifft(Y2,128); %�ϳť߸��ഫ
% subplot(4,1,4); 
% stem(start:128-abs(start)-1, y2);    % �e�X y1[n] �T����
% xlim([start-1, stop+1]);
% xlabel('y2[n] = ifft( fft(x[n])*fft(h[n]) )');
