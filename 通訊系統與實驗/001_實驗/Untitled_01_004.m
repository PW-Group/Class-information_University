clc;clear all;close all;

%�u�ʲզX
clear; 
%fs = 10e3;   %10kHz �����W�v
fs = 100;
i = 1;
for t = -5:1/fs:5
  if (t >=-1) &&  (t <= 1) 
      x(i) = 1-abs(t); %abs(t) ��t�����
  else x(i) = 0;
  end
  i = i+1;
end
t = -5:1/fs:5;
plot(t,x);
xlabel('�ɶ�'); % x �b����
ylabel('�ƭ�'); % y �b����
title('�T����'); %; �ϤW�軡��
legend('�u�ʲզX'); %�Ϥ�����;
ylim([0,2]); %����y�b�W��ܤ��d��