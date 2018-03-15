function shiftSim(config, lucasFolder)    
    updateEbNo("0:1:12");
    updateMultipath("NONE");
    updateGuardBand(config.carriersDistance);
    updateShift(config.shift);

    %% OFDM
    fprintf("OFDM STARTED \n")
    update5GWaveform("OFDM");
    hermes;
    ofdm_statistics = gBSimSaveResults(statistics);
    clear statistics;
    save(strcat(lucasFolder, "OFDM.mat"), "ofdm_statistics")
    fprintf("OFDM FINISHED \n")

    %% Hanning
    fprintf("HANNING STARTED \n")
    updatefOFDMWindow('hann');
    hermes;
    hann_statistics = gBSimSaveResults(statistics);
    clear statistics;
    save(strcat(lucasFolder, "hann.mat"), "hann_statistics")
    fprintf("HANNING FINISHED \n")

    updateShift(shiftEnum.none);
end