% 此範例展示一個簡單正弦波的傅立葉轉換，以雙邊頻譜來顯示
% 此正弦波的頻率不是 freqStep 的整數倍，所以雙邊頻譜會「散開」(Smearing)

N = 256;			% 點數
fs = 8000;			% 取樣頻率
freqStep = fs/N;		% 頻域的頻率的解析度
f = 10.5*freqStep;		% 正弦波的頻率，不是 freqStep 的整數倍
time = (0:N-1)/fs;		% 時域的時間刻度
y = cos(2*pi*f*time);		% Signal to analyze
Y = fft(y);			% Spectrum
Y = fftshift(Y);

% Plot time data
subplot(3,1,1);
plot(time, y, '.-');
title('Sinusoidal signals');
xlabel('Time (seconds)'); ylabel('Amplitude');
axis tight

% Plot spectral magnitude
subplot(3,1,2);
freq = freqStep*(-N/2:N/2-1);	% 頻域的頻率刻度
%plot(freq, abs(Y), '.-b'); grid on
stem(freq, abs(Y)); grid on
xlabel('Frequency)'); 
ylabel('Magnitude (Linear)');

% Plot phase
subplot(3,1,3);
plot(freq, angle(Y), '.-b'); grid on
xlabel('Frequency)'); 
ylabel('Phase (Radian)');