clc;clear all;close all;
%n1 = -1:1:1;  % �]�w��J x[n] �ɶ��b
%x = (1/2).^n1; % �����J x[n]  ����

%�u�ʲզX
%fs = 10e3;   %10kHz �����W�v
fs = 5;
N = 128;
i = 1;
for t = -2:1/fs:2
  if (t >=-1) &&  (t <= 1) 
      x(i) = 1-abs(t); %abs(t) ��t�����
  else x(i) = 0;
  end
  i = i+1;
end
t = -2:1/fs:2;
n1 = -10:1:10;


n2=-10:1:10;   % �]�w��J h[n] �ɶ��b
x2 = [ones(1,1), zeros(1,19),ones(1,1)];    %�]�w x2=[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1];
y = conv(x2,x); % ����P�n y[n] = x[n]*h[n] 

len = length(n1)+length(n2)-1; % �P�n y[n] ������ 
start = n1(1)+n2(1);  % �p��}�l�P�n���ɶ��I 
stop = n1(1)+n2(1) + len-1;  % �p�⵲���P�n���ɶ��I 
n3 = start:1:stop; 

X = fft(x);
X = fft(x,N);
x = ifft(X);
x = ifft(X,N);
subplot(4,1,1); 
stem(t,x);  % �e�X x[n] �T����
xlabel('x1[n]');
xlim([start-1, stop+1]);

subplot(4,1,2);
stem(n2,x2); % �e�X h[n] �T����
xlim([start-1, stop+1]);
xlabel('x2[n]');

subplot(4,1,3); 
stem(n3, y);    % �e�X y[n] �T����
xlim([start-1, stop+1]);
xlabel('y[n] = x1[n]*x2[n]');
%{
x1 = [x, zeros(1,length(x2)-1)]; %���W length(h)-1 �ӹs�I�A�H�U�L�{�~���򥿽T���G 
x2 = [x2, zeros(1,length(x)-1)]; %���W length(x)-1 �ӹs�I�A�H�U�L�{�~���򥿽T���G 
X1 = ifft(x1);
X1 = ifft(x1,128); %�H128�I�����p��fft����¦
X2 = ifft(x2);
X2 = ifft(x2,128); %�H128�I�����p��fft����¦
Y2 = X1 .* X2;  %�W�줤�ۭ� = �ɰ줤�P�n 
y2 = ifft(Y2,128); %�ϳť߸��ഫ
subplot(4,1,4); 
stem(start:128-abs(start)-1, y2);    % �e�X y1[n] �T����
xlim([start-1, stop+1]);
xlabel('y2[n] = ifft( fft(x1[n])*fft(x2[n]) )');
%}