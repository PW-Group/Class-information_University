clc;clear all;close all;

%�u�ʲզX
clear; 
%fs = 10e3;   %10kHz �����W�v
fs = 100;
i = 1;
for t = -10:1/fs:40
  if (t >=-8) &&  (t <= 0) 
      x(i) = 2*(t^2)+2;
  elseif (t>0) && (t<= 2) 
      x(i) = 2;
  elseif (t>2) && (t<= 18) 
      x(i) = 2+2*cos(pi*(t^2));
  elseif (t>18) && (t<= 32)
      x(i) = 2;
  else x(i) = 0;
  end
  i = i+1;
end
t = -10:1/fs:40;
plot(t,x);
xlabel('�ɶ�'); % x �b����
ylabel('�ƭ�'); % y �b����
title('�T����'); %; �ϤW�軡��
legend('�u�ʲզX'); %�Ϥ�����;
ylim([-5,150]); %����y�b�W��ܤ��d��