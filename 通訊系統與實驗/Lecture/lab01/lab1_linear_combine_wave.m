%�u�ʲզX
clear; 
%fs = 10e3;   %10kHz �����W�v
fs = 100;
i = 1;
for t = -3:1/fs:5
  if (t >=-2) &&  (t <= 0) 
      x(i) = t+2;
  elseif (t>0) && (t<= 1) 
      x(i) = 2;
  elseif (t>1) && (t<= 3) 
      x(i) = 2+2*cos(0.5*pi*t);
  elseif (t>3) && (t<= 4)
      x(i) = 2;
  else x(i) = 0;
  end
  i = i+1;
end
t = -3:1/fs:5;
plot(t,x);
xlabel('�ɶ�'); % x �b����
ylabel('�ƭ�'); % y �b����
title('�T����'); %; �ϤW�軡��
legend('�u�ʲզX'); %�Ϥ�����;
ylim([0,3]); %����y�b�W��ܤ��d��
