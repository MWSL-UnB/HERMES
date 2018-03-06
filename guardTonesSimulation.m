clear all;
updateMultipath("NONE")
lucasFolder = "windowsSimulationsResults\guardTones2.0\2db\";
max_GuardBand = 60e3; %1 tone = 15e3
snr_dB = 2;
points = 12;

%% OFDM
fprintf("OFDM STARTED \n")
update5GWaveform("OFDM");
ofdm_statistics = gBSim(max_GuardBand, snr_dB, points);
save(strcat(lucasFolder, "OFDM.mat"))
fprintf("OFDM FINISHED \n")

%% Hanning
fprintf("HANNING STARTED \n")
updatefOFDMWindow('hann');
hann_statistics = gBSim(max_GuardBand, snr_dB, points);
save(strcat(lucasFolder, "hann.mat"))
fprintf("HANNING FINISHED \n")