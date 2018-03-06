function [output] = testFunc()
%TESTFUNC Summary of this function goes here
%   Detailed explanation goes here
% f = 500; %largura do filtro
% interval = -f:0.1:f-1;
% points = f/2;
% filter = rectangularPulse(-points, points, interval);
% output.f = f;
% output.interval = interval;
% output.filterInFreq = filter;

% figure(1)
% grid on
% plot(interval,filter)
% xlabel("Frequency [Hz]")
% ylabel("Magnitude [V]")
% 
% Filter = ifftshift(ifft(ifftshift(filter)));
% output.filterInTime = Filter;

fftSize = 2048;
truncatingPoint = 8;
B = 20;
fs = 1/(2*truncatingPoint/fftSize);

x = -truncatingPoint:1/fs:truncatingPoint-1/fftSize;
impulseResponse = sinc(2*B*x);
output.impulseResponse = impulseResponse;

frequencyResponse = fftshift(fft(impulseResponse));
output.frequencyResponse = frequencyResponse;

figure(1)
subplot(1,2,1)
plot(x, impulseResponse)
grid on
xlabel("samples")
ylabel("Magnitude [V]")

subplot(1,2,2)
plot(-fs/2:fs/fftSize:fs/2-1/fftSize,abs(frequencyResponse))
grid on
xlabel("Frequency [Hz]")
ylabel("Magnitude [V]")

output.fs = fs;








% figure(2)
% grid on
% plot(Filter)
% xlabel("samples")
% ylabel("Magnitude [V]")
% 
% fvtool(Filter)


end

