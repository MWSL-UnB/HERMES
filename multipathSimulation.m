clear all
updateMultipath("RURAL_AREA")
lucasFolder = "windowsSimulationsResults\multipath2.0\rural_area\";

%% OFDM
fprintf("OFDM STARTED \n")
update5GWaveform("OFDM");
hermes;
ofdm_statistics = gBSimSaveResults(statistics);
clear statistics;
save(strcat(lucasFolder, "OFDM.mat"))
fprintf("OFDM FINISHED \n")

%% Hanning
fprintf("HANNING STARTED \n")
updatefOFDMWindow('hann');
hermes;
hann_statistics = gBSimSaveResults(statistics);
clear statistics;
save(strcat(lucasFolder, "hann.mat"))
fprintf("HANNING FINISHED \n")

%% Blackman
fprintf("BLACKMAN STARTED \n")
updatefOFDMWindow("black");
hermes;
black_statistics = gBSimSaveResults(statistics);
clear statistics;
save(strcat(lucasFolder, "black.mat"))
fprintf("BLACKMAN FINISHED \n")
% 
%% Kaiser
fprintf("KAISER STARTED \n")
updatefOFDMWindow("kaiser");
hermes;
kaiser_statistics = gBSimSaveResults(statistics);
clear statistics;
save(strcat(lucasFolder, "kaiser.mat"))
fprintf("KAISER FINISHED \n")
% 
%% Rectangular
fprintf("RECTANGULAR STARTED \n")
updatefOFDMWindow("rect");
hermes;
rect_statistics = gBSimSaveResults(statistics);
clear statistics;
save(strcat(lucasFolder, "rect.mat"))
fprintf("RECTANGULAR FINISHED \n")

%% Others
% updatefOFDMWindow('hamm');
% hermes;

% updatefOFDMWindow('cheb');
% hermes;

% updatefOFDMWindow('gauss');
% hermes;
