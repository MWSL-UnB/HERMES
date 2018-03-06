function plotWindowsSim( sim1, sim2, sim3, sim4 )
%PLOTWINDOWSSIM Summary of this function goes here
%   Detailed explanation goes here

figure(1)
grid on
semilogy(sim1.snrVector, sim1.berMean, '-*', ...
     sim2.snrVector, sim2.berMean, '-o', ...
     sim3.snrVector, sim3.berMean, '-x', ...
     sim4.snrVector, sim4.berMean, '-+')
 
title("BER comparison for different FIR filters")
xlabel("SNR [dB]")
ylabel("BER")
legend(sim1.Window, sim2.Window, sim3.Window, sim4.Window)

end

