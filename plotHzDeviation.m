figure(1)
semilogy(hann_statistics.snrVector, hann_statistics.berMean, '-or', ...     
         ofdm_statistics.snrVector, ofdm_statistics.berMean, '-db')
 if isequal(ofdm_statistics.simulationParamters.Multipath, 'Unitary Channel')
    str = sprintf("fOFDM and OFDM 2 Hz deviation - Multipath: %s - %s - AWGN channel", ...
    ofdm_statistics.simulationParamters.Multipath, ofdm_statistics.simulationParamters.modulation);    
 else
     str = sprintf("fOFDM and OFDM  2 Hz deviation - Multipath: %s %s - %s - AWGN channel", ...
     ofdm_statistics.simulationParamters.Multipath, ofdm_statistics.simulationParamters.typeChannel, ofdm_statistics.simulationParamters.modulation);     
 end
title(str)
xlabel("SNR [dB]")
ylabel("BER")
legend("fOFDM", "OFDM")
grid on