x=[1 2 0 -1 3 2];
h=[1 -1 1];
m=size(x,1);
n=size(h,1);
ix=-2:3;%x��?��
ih=0:2; %h��?��
iy=-3:4;%y��?���A?��?6+3-1=8
y=conv(x,h);%�ô���?
subplot(1,3,1);
stem(ix,x,'fill','r','LineWidth',2);xlabel('ix');ylabel('x');grid on
subplot(1,3,2);%�Q�Χ�??�]STEM)?�Xx
stem(ih,h,'fill','g','LineWidth',2);xlabel('ih');ylabel('h');grid on
subplot(1,3,3);%�Q�Χ�??�]STEM)?�Xh
stem(iy,y,'fill','b','LineWidth',2);xlabel('iy');ylabel('y');grid on
               %�Q�Χ�??�]STEM)?�Xy