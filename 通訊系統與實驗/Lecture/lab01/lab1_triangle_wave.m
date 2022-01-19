%
% ����ت� : ��ܰT�����򥻹B��A�]�t���Y(Signal Stretch and Compression)�B
% ����(shift)�B��g(Reflection)�Ψ�u�ʲզX��

clear;    %�M���Ҧ���Ʀp�ܼƹϫ���
fs = 10e3;   %10kHz �����W�v 
t = -.1:1/fs:0.1; %����200 ms���ɶ��I�A �C�I���j�� 1/10kHz�A�@��2001�ɶ��I
w = 40e-3;  %  �ߪi���Z = 40 ms
x = tripuls(t,w); %���ͤT���i(-0.1 ~ 0.1, �ߪi���Z = 40 ms)
plot(t,x);
xlabel('�ɶ�'); % x �b����
ylabel('�ƭ�'); % y �b����
title('�T����'); %; �ϤW�軡��
legend('�T���i��'); %�Ϥ�����;
pause;  %�Ȱ�

%�T�����Y
a = 0.6;
y = tripuls(t,w/a); % y(t) = x(at)
plot(t,y);
xlabel('�ɶ�'); 
ylabel('�ƭ�'); 
title('���Y�T����'); 
legend('y(t)=x(0.6t)'); 
pause;  

%����
b = 2;
t1 = t-b; % y(t) = x(t+b) 
y1 = x;
plot(t1,y1);
xlabel('�ɶ�'); 
ylabel('�ƭ�'); 
title('�����T����'); 
legend('y(t)=x(t+2)');
xlim([min(t1), max(t1)]);
pause;  

%��g
s = 1; % �n�ײv(skew), -1 <= s <=1
x1 = tripuls(t,w,s);
subplot(2,1,1) %�L�W��
plot(t,x1);
xlabel('�ɶ�'); 
ylabel('�ƭ�'); 
title('��T����'); 
legend('x(t)');
d = max(size(t)); %��X�ɶ� t ������
y2 = zeros(size(x));
for i=1:d
    y2(i) = x1(1+d-i); % �e����
end
subplot(2,1,2) %�L�U��
plot(t,y2);
xlabel('�ɶ�'); 
ylabel('�ƭ�'); 
title('��g�T����'); 
legend('y = x(-t)');







