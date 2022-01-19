x=[1 2 0 -1 3 2];
h=[1 -1 1];
m=size(x,1);
n=size(h,1);
ix=-2:3;%x指?集
ih=0:2; %h指?集
iy=-3:4;%y指?集，?度?6+3-1=8
y=conv(x,h);%离散卷?
subplot(1,3,1);
stem(ix,x,'fill','r','LineWidth',2);xlabel('ix');ylabel('x');grid on
subplot(1,3,2);%利用杆??（STEM)?出x
stem(ih,h,'fill','g','LineWidth',2);xlabel('ih');ylabel('h');grid on
subplot(1,3,3);%利用杆??（STEM)?出h
stem(iy,y,'fill','b','LineWidth',2);xlabel('iy');ylabel('y');grid on
               %利用杆??（STEM)?出y