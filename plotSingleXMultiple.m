figure(1)
semilogy(hann_statistics2.snrVector, hann_statistics2.berMean, '-*b', ...
     hann_statistics.snrVector, hann_statistics.berMean, '-or', ...
     ofdm_statistics2.snrVector, ofdm_statistics2.berMean, '-xb', ...     
     ofdm_statistics.snrVector, ofdm_statistics.berMean, '-dr')
 if isequal(ofdm_statistics.simulationParamters.Multipath, 'Unitary Channel')
    str = sprintf("fOFDM and OFDM Single signal Vs Multiple signals - Multipath: %s - %s - AWGN channel", ...
    ofdm_statistics.simulationParamters.Multipath, ofdm_statistics.simulationParamters.modulation);    
 else
     str = sprintf("fOFDM and OFDM Single signal Vs Multiple signals - Multipath: %s %s - %s - AWGN channel", ...
     ofdm_statistics.simulationParamters.Multipath, ofdm_statistics.simulationParamters.typeChannel, ofdm_statistics.simulationParamters.modulation);     
 end
title(str)
xlabel("SNR [dB]")
ylabel("BER")
legend("Hanning Single", "Hanning Multiple", "OFDM Single", "OFDM Multiple")
grid on