figure(1)
semilogy(hann_statistics.snrVector, hann_statistics.berMean, '-ob', ...     
     ofdm_statistics.snrVector, ofdm_statistics.berMean, '-dr')
 if isequal(ofdm_statistics.simulationParamters.Multipath, 'Unitary Channel')
    str = sprintf("fOFDM and OFDM Single signal - Multipath: %s - %s - AWGN channel", ...
    ofdm_statistics.simulationParamters.Multipath, ofdm_statistics.simulationParamters.modulation);    
 else
     str = sprintf("fOFDM and OFDM Single signal - Multipath: %s %s - %s - AWGN channel", ...
     ofdm_statistics.simulationParamters.Multipath, ofdm_statistics.simulationParamters.typeChannel, ofdm_statistics.simulationParamters.modulation);     
 end
title(str)
xlabel("SNR [dB]")
ylabel("BER")
legend("Hanning Single", "OFDM Single")
grid on