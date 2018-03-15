function guardTonesSim (config, lucasFolder)
    updateMultipath("NONE")    

    %% OFDM
    fprintf("OFDM STARTED \n")
    update5GWaveform("OFDM");
    ofdm_statistics = gBSim(config.signalBand, config.maxGuardband, config.SNR_dB, config.points);
    save(strcat(lucasFolder, "OFDM.mat"), "ofdm_statistics")
    fprintf("OFDM FINISHED \n")

    %% Hanning
    fprintf("HANNING STARTED \n")
    updatefOFDMWindow('hann');
    hann_statistics = gBSim(config.signalBand, config.maxGuardband, config.SNR_dB, config.points);
    save(strcat(lucasFolder, "hann.mat"), "hann_statistics")
    fprintf("HANNING FINISHED \n")
end