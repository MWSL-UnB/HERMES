function plotMultipleShifts(hann1, hann2, ofdm1, ofdm2)

    semilogy(hann1.snrVector, hann1.berMean, '-ob', ...
            hann2.snrVector, hann2.berMean, '-*b', ...   
            ofdm1.snrVector, ofdm1.berMean, '-sr', ...   
            ofdm2.snrVector, ofdm2.berMean, '-dr')   

    if isequal(ofdm1.simulationParamters.Multipath, 'Unitary Channel')
        str = sprintf("fOFDM and OFDM Asynchronous transmission - Multipath: %s - %s - AWGN channel, Guardband: 1 tone", ...
        ofdm1.simulationParamters.Multipath, ofdm1.simulationParamters.modulation);    
    else
        str = sprintf("fOFDM and OFDM Asynchronous transmission - Multipath: %s %s - %s - AWGN channel, Guardband: 1 tone", ...
        ofdm1.simulationParamters.Multipath, ofdm1.simulationParamters.typeChannel, ofdm_statistics.simulationParamters.modulation);     
    end        

    title(str)
    xlabel("SNR [dB]")
    ylabel("BER")
    legend("fOFDM - 100th-symbol shift", "fOFDM - Half-symbol shift", "OFDM - 100th-symbol shift", "OFDM - Half-symbol shift")
    grid on
end