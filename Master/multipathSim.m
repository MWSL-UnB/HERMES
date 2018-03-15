function multipathSim(config, lucasFolder)

    switch config.multipath
        case "NONE"
            updateEbNo("0:1:12");
        case "TYPICAL_URBAN"
            updateEbNo("0:20/12:20");
        case "RURAL_AREA"
            updateEbNo("0:20/12:20");
    end

    updateMultipath(config.multipath)    
    updateGuardBand(config.carriersDistance);    

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

    %% Blackman
    fprintf("BLACKMAN STARTED \n")
    updatefOFDMWindow("black");
    hermes;
    black_statistics = gBSimSaveResults(statistics);
    clear statistics;
    save(strcat(lucasFolder, "black.mat"), "black_statistics")
    fprintf("BLACKMAN FINISHED \n")
    % 
    %% Kaiser
    fprintf("KAISER STARTED \n")
    updatefOFDMWindow("kaiser");
    hermes;
    kaiser_statistics = gBSimSaveResults(statistics);
    clear statistics;
    save(strcat(lucasFolder, "kaiser.mat"), "kaiser_statistics")
    fprintf("KAISER FINISHED \n")
    % 
    %% Rectangular
    fprintf("RECTANGULAR STARTED \n")
    updatefOFDMWindow("rect");
    hermes;
    rect_statistics = gBSimSaveResults(statistics);
    clear statistics;
    save(strcat(lucasFolder, "rect.mat"), "rect_statistics")
    fprintf("RECTANGULAR FINISHED \n")

end