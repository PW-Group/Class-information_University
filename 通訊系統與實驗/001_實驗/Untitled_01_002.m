clc;clear all;close all;

%�u�ʲզX
clear; 
%fs = 10e3;   %10kHz �����W�v
fs = 100;
i = 1;
for t = -3 :1/fs: 4
  if (t >=-2) &&  (t <=-1) 
      x(i) = 2*sin(2*pi*t);
  elseif (t>2) && (t<= 3) 
      x(i) = -sin(2*pi*t);
  else x(i) = 0;
  end
  i = i+1;
end
t = -3:1/fs:4;
y = x;
plot(t,y);
xlabel('�ɶ�'); % x �b����
ylabel('�ƭ�'); % y �b����
title('�T����'); %; �ϤW�軡��
legend('�D�g�������i���զX'); %�Ϥ�����;
ylim([-2,2]); %����y�b�W��ܤ��d��
grid on