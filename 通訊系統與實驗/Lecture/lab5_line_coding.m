% �i�� 4�ؤ��P�� line codings
% Unipolar NRZ
% Unipolar RZ
% Bi-Polar RZ
% Manchester (Bi-Polar NRZ)

bits = [1 0 1 0 0 0 1 1 0]; %�H��
%bits = [1 1 1 1 1 1 1 1 1]; %�H��
bitrate = 1; % �줸�v = 1 bit per second

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
title('Frequency Spectrum');
subplot(3,1,3);
plot(freq, abs(fftshift(fft(s))));
title('Frequency Spectrum of [-50, 50]');
xlim([-50, 50]);

