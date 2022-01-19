clc;clear all;close all;
i = 1;

for t=0:1:100

a = (sin(100*pi*t))/(pi*t);
b = (sin(200*pi*t))/(pi*t);
c = (sin(300*pi*t))/(pi*t);
d = (sin(400*pi*t))/(pi*t);
e = conv(a,b);
f = conv(e,c);
g(i) = conv(f,d);

i = i+1;

end
t =0:1:100;
plot(t,g)