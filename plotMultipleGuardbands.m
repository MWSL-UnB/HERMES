function plotMultipleGuardbands(hann1, hann2, ofdm1, ofdm2)

    semilogy(hann1.snrVector, hann1.berMean, '-or', ...
             hann2.snrVector, hann2.berMean, '-*r', ...
             ofdm1.snrVector, ofdm1.berMean, '-db', ...
             ofdm2.snrVector, ofdm2.berMean, '-sb')                  
    if isequal(ofdm1.simulationParamters.Multipath, 'Unitary Channel')
        str = sprintf("fOFDM and OFDM - Multipath: %s - %s - AWGN channel", ...
            ofdm1.simulationParamters.Multipath, ofdm1.simulationParamters.modulation);    
    else
        str = sprintf("fOFDM and OFDM - Guardband: %d - Multipath: %s %s - %s - AWGN channel", ...
        ofdm1.simulationParamters.Multipath, ofdm1.simulationParamters.typeChannel, ofdm1.simulationParamters.modulation);     
    end

    title(str)
    xlabel("SNR [dB]")
    ylabel("BER")
    legend("fOFDM - band", "fOFDM - band/2", "OFDM - band", "OFDM - band/2")
    grid on
end