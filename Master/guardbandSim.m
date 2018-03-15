function guardbandSim( config, folder )
%GUARDBANDSIM Summary of this function goes here
%   Detailed explanation goes here
% Author: Lucas Baião Pires    
    updateMultipath("NONE");        
    updateGuardBand(config.carriersDistance);
    updateEbNo("0:10/12:10");

    %% OFDM
    fprintf("OFDM STARTED \n")
    update5GWaveform("OFDM");
    hermes;
    ofdm_statistics = gBSimSaveResults(statistics);
    ofdm_statistics.simulationParameters.signalBand = config.signalBand;
    ofdm_statistics.simulationParameters.guardBand = config.guardBand;
    ofdm_statistics.simulationParameters.carriersDistance = config.carriersDistance;
    clear statistics;
    save(strcat(folder, "OFDM.mat"), "ofdm_statistics")
    fprintf("OFDM FINISHED \n")

    %% Hanning
    fprintf("HANNING STARTED \n")
    updatefOFDMWindow('hann');
    hermes;
    hann_statistics = gBSimSaveResults(statistics);
    hann_statistics.simulationParameters.signalBand = config.signalBand;
    hann_statistics.simulationParameters.guardBand = config.guardBand;
    hann_statistics.simulationParameters.carriersDistance = config.carriersDistance;
    clear statistics;
    save(strcat(folder, "hann.mat"), "hann_statistics")
    fprintf("HANNING FINISHED \n")

end

