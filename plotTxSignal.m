txSignalFreq = real(fftshift(fft(txSignal{2})));

figure(1)
plot(txSignalFreq);
xlabel('frequência [Hz]');
ylabel('|txSignal|');
title('txSignal');