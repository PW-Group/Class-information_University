function [t,x] = przz(bits, bitrate)
% PRZ Encode bit string using Bi-polar NRZ code.
%   [T, X] = PRZ(BITS, BITRATE) encodes BITS array using polar RZ
%   code with given BITRATE. Outputs are time T and encoded signal
%   values X.

% Copyright (c) 2013 Yuriy Skalko <yuriy.skalko@gmail.com>

T = length(bits)/bitrate; % full time of bit sequence
n = 200;
N = n*length(bits);
dt = T/N;
t = 0:dt:T-dt;
x = zeros(1,length(t)); % output signal

for i = 0:length(bits)-1
  if bits(i+1) == 1
    x(i*n+1:(i+1)*n) = 1;
    x((i+1)*n+1:(i+1)*n) = 0;
  else
    x(i*n+1:(i+1)*n) = -1;
    x((i+1)*n+1:(i+1)*n) = 0;
  end
end
