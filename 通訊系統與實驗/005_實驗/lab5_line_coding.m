clc;clear all;close all;

bits = [0 1 0 1 0 1 0 1 0]; 
bitrate = 1; 

figure;
[t,s] = unrz(bits,bitrate);  
subplot(3,1,1);
plot(t,s,'LineWidth',3);
axis([0 t(end) -0.1 1.1])
grid on;
title(['Unipolar NRZ: [' num2str(bits) ']']);
N = length(t);
freq = -N/2:N/2-1;
subplot(3,1,2);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum');
subplot(3,1,3);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum of [-50, 50]');
xlim([-50, 50]);

figure;
[t,s] = urz(bits,bitrate); 
subplot(3,1,1);
plot(t,s,'LineWidth',3);
axis([0 t(end) -0.1 1.1])
grid on;
title(['Unipolar RZ: [' num2str(bits) ']']);
N = length(t);
freq = -N/2:N/2-1;
subplot(3,1,2);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum');
subplot(3,1,3);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum of [-50, 50]');
xlim([-50, 50]);

figure;
[t,s] = prz(bits,bitrate); 
subplot(3,1,1);
plot(t,s,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Bi-Polar RZ: [' num2str(bits) ']']);
N = length(t);
freq = -N/2:N/2-1;
subplot(3,1,2);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum');
subplot(3,1,3);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum of [-50, 50]');
xlim([-50, 50]);

figure;
[t,s] = manchester(bits,bitrate); 
subplot(3,1,1);
plot(t,s,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Manchester: [' num2str(bits) ']']);
N = length(t);
freq = -N/2:N/2-1;
subplot(3,1,2);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum');
subplot(3,1,3);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum of [-50, 50]');
xlim([-50, 50]);

