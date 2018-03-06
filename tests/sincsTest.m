%fftSize = 2048;
truncatingPoint = 0.001;

B = 1000;
fs = 20000;
x = -truncatingPoint:1/fs:truncatingPoint-1/fs;
impulseResponse = sinc(2*pi*B*x);
% frequencyResponse = fftshift(fft(impulseResponse));

% figure(2)
% subplot(1,2,1)
% plot(impulseResponse)
% grid on
% xlabel("samples")
% ylabel("Magnitude [V]")
% 
% frequencyDomain = -fs/2:fs/length(impulseResponse):fs/2-fs/length(impulseResponse);
% normalizedF = frequencyDomain./(fs/2);
% subplot(1,2,2)
% plot(normalizedF,abs(frequencyResponse))
% grid on
% xlabel("Normalized Frequency (x \pi rad/sample )")
% ylabel("Magnitude [V]")
% 
% figure(3)
% subplot(1,2,1)
% plot(20*log10(abs(impulseResponse)))
% grid on
% xlabel("samples")
% ylabel("Magnitude [V]")
% 
% frequencyDomain = -fs/2:fs/length(impulseResponse):fs/2-fs/length(impulseResponse);
% normalizedF = frequencyDomain./(fs/2);
% subplot(1,2,2)
% plot(normalizedF, 20*log(abs(frequencyResponse)))
% grid on
% xlabel("Normalized Frequency (x \pi rad/sample )")
% ylabel("Magnitude [V]")

truncatingPoint = 0.002;
x = -truncatingPoint:1/fs:truncatingPoint-1/fs;
impulseResponse2 = sinc(2*pi*B*x);
% frequencyResponse = fftshift(fft(impulseResponse));

truncatingPoint = 1;
x = -truncatingPoint:1/fs:truncatingPoint-1/fs;
impulseResponse3 = sinc(2*pi*B*x);

fvtool(impulseResponse, 1, impulseResponse2, 1, impulseResponse3, 1)
legend("M = 40", "M = 80", "M = 400")