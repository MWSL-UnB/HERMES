clear all
updateMultipath("NONE")
lucasFolder = "windowsSimulationsResults\Shift2.0\Delay100th\";
signalBand = 99e6;     %signal bandwidth. Both signals have the same bandwidth
guardBand = 1e6;      %guardband between signals. 1 tone = 15e3.
carriersDistance = signalBand + guardBand;       % max distance between signals' center frequencies
updateGuardBand(carriersDistance);

%% OFDM
fprintf("OFDM STARTED \n")
update5GWaveform("OFDM");
hermes;
ofdm_statistics = gBSimSaveResults(statistics);
ofdm_statistics.simulationParameters.signalBand = signalBand;
ofdm_statistics.simulationParameters.guardBand = guardBand;
ofdm_statistics.simulationParameters.carriersDistance = carriersDistance;
clear statistics;
save(strcat(lucasFolder, "OFDM.mat"))
fprintf("OFDM FINISHED \n")

%% Hanning
fprintf("HANNING STARTED \n")
updatefOFDMWindow('hann');
hermes;
hann_statistics = gBSimSaveResults(statistics);
hann_statistics.simulationParameters.signalBand = signalBand;
hann_statistics.simulationParameters.guardBand = guardBand;
hann_statistics.simulationParameters.carriersDistance = carriersDistance;
clear statistics;
save(strcat(lucasFolder, "hann.mat"))
fprintf("HANNING FINISHED \n")

