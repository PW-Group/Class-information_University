clc;clear all;close all;

%�u�ʲզX
clear; 
%fs = 10e3;   %10kHz �����W�v
fs = 100;
i = 1;
for t = 1:1/fs:3
  if (t >=8/5) &&  (t <=2) 
      x(i) = 5*t-8;
  elseif (t>2) && (t<= 11/5) 
      x(i) = 2;
  elseif (t>11/5) && (t<= 13/5) 
      x(i) = 2-2*cos(2.5*pi*t);
  elseif (t>13/5) && (t<= 14/5)
      x(i) = 2;
  else x(i) = 0;
  end
  i = i+1;
end
t = 1:1/fs:3;
y = x-2;
plot(t,y);
xlabel('�ɶ�'); % x �b����
ylabel('�ƭ�'); % y �b����
title('�T����'); %; �ϤW�軡��
legend('�u�ʲզX'); %�Ϥ�����;
ylim([-2.5,0.5]); %����y�b�W��ܤ��d��