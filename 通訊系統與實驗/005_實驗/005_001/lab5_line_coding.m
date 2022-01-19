clear all,close all;clc
bits = [1 1 1 1 1 1 1 1 1]; %信息
bitrate = 1; % 位元率 = 1 bit per second

figure;
[t,s] = unrz(bits,bitrate);  % Unipolar NRZ
subplot(3,1,1);
plot(t,s,'LineWidth',3);
axis([0 t(end) -0.1 1.1])
grid on;
title(['Unipolar NRZ: [' num2str(bits) ']']);
N = length(t);
freq = -N/2:N/2-1;
subplot(3,1,2);
plot(freq, abs(fftshift(fft(s))));
a1=abs(fftshift(fft(s)));
suma1=sum(a1)
title('Frequency Spectrum');
subplot(3,1,3);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum of [-50, 50]');
xlim([-50, 50]);

figure;
[t,s] = urz(bits,bitrate); %Unipolar RZ
subplot(3,1,1);
plot(t,s,'LineWidth',3);
axis([0 t(end) -0.1 1.1])
grid on;
title(['Unipolar RZ: [' num2str(bits) ']']);
N = length(t);
freq = -N/2:N/2-1;
subplot(3,1,2);
plot(freq, abs(fftshift(fft(s))));
a2=abs(fftshift(fft(s)));
suma2=sum(a2)
title('Frequency Spectrum');
subplot(3,1,3);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum of [-50, 50]');
xlim([-50, 50]);

figure;
[t,s] = prz(bits,bitrate); % Bi-Polar RZ
subplot(3,1,1);
plot(t,s,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Bi-Polar RZ: [' num2str(bits) ']']);
N = length(t);
freq = -N/2:N/2-1;
subplot(3,1,2);
plot(freq, abs(fftshift(fft(s))));
a3=abs(fftshift(fft(s)));
suma3=sum(a3)
title('Frequency Spectrum');
subplot(3,1,3);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum of [-50, 50]');
xlim([-50, 50]);

figure;
[t,s] = manchester(bits,bitrate); % Manchester (Bi-Polar NRZ)
subplot(3,1,1);
plot(t,s,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Manchester: [' num2str(bits) ']']);
N = length(t);
freq = -N/2:N/2-1;
subplot(3,1,2);
plot(freq, abs(fftshift(fft(s))));
a4=abs(fftshift(fft(s)));
suma4=sum(a4)
title('Frequency Spectrum');
subplot(3,1,3);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum of [-50, 50]');
xlim([-50, 50]);