% Author: Lucas Baiao Pires
%% Configuration

masterConfig;

%% Signal's medium length definition

updateSignalLength(signalLengthConfig.fftSize, signalLengthConfig.usefulSubcarriers, signalLengthConfig.subcarriersSpacing, signalLengthConfig.TransportBlockSizeBits, signalLengthConfig.dropsDuration);

%% guardBand - Fixed bandwidth and varying Eb/No - 2 tones distance

switch signalLengthConfig.flag
    case lengthEnum.estreito
        guardBandfolder = "windowsSimulationsResults\Master\multi-signal\estreitos\guardband\";
    case lengthEnum.medio
        guardBandfolder = "windowsSimulationsResults\Master\multi-signal\medios\guardband\";
    case lengthEnum.largo
        guardBandfolder = "windowsSimulationsResults\Master\multi-signal\largos\guardband\";            
end

%% 0 tone
folder = strcat(guardBandfolder, "0tone\");
guardbandConfig.guardBand = 0;      %guardband between signals. 1 tone = 15e3.
guardbandConfig.carriersDistance = guardbandConfig.signalBand + guardbandConfig.guardBand;       % max distance between signals' center frequencies
for i = 1:3
    folder = strcat(folder, num2str(i), '\');
    guardbandSim(guardbandConfig, folder);
    folder = strcat(guardBandfolder, "0tone\");
end

%% 1 tone
folder = strcat(guardBandfolder, "1tone\");
guardbandConfig.guardBand = 15e3;      %guardband between signals. 1 tone = 15e3.
guardbandConfig.carriersDistance = guardbandConfig.signalBand + guardbandConfig.guardBand;       % max distance between signals' center frequencies
for i = 1:3
    folder = strcat(folder, num2str(i), '\');
    guardbandSim(guardbandConfig, folder);
    folder = strcat(guardBandfolder, "1tone\");
end

%% 2 tones
folder = strcat(guardBandfolder, "2tones\");
guardbandConfig.guardBand = 30e3;      %guardband between signals. 1 tone = 15e3.
guardbandConfig.carriersDistance = guardbandConfig.signalBand + guardbandConfig.guardBand;       % max distance between signals' center frequencies
for i = 1:3
    folder = strcat(folder, num2str(i), '\');
    guardbandSim(guardbandConfig, folder);
    folder = strcat(guardBandfolder, "2tones\");    
end

%% -band 
folder = strcat(guardBandfolder, "band\");
guardbandConfig.guardBand = 0;
guardbandConfig.carriersDistance = 0;       % max distance between signals' center frequencies
guardbandSim(guardbandConfig, folder);
% for i = 1:3
%     folder = strcat(folder, num2str(i), '\');
%     guardbandSim(guardbandConfig, folder);
%     folder = strcat(guardBandfolder, "band\");    
% end

%% -band/2
folder = strcat(guardBandfolder, "band2\");
guardbandConfig.guardBand = 0;
guardbandConfig.carriersDistance = guardbandConfig.signalBand/2;       % max distance between signals' center frequencies
guardbandSim(guardbandConfig, folder);
% for i = 1:3
%     folder = strcat(folder, num2str(i), '\');
%     guardbandSim(guardbandConfig, folder);
%     folder = strcat(guardBandfolder, "band2\");    
% end

fprintf("FINISHED GUARDBAND")

%% guardTones - Fixed Eb/No and varying guard band

switch signalLengthConfig.flag
    case lengthEnum.estreito
        guardTonesfolder = "windowsSimulationsResults\Master\multi-signal\estreitos\guardtones\";
    case lengthEnum.medio
        guardTonesfolder = "windowsSimulationsResults\Master\multi-signal\medios\guardtones\";
    case lengthEnum.largo
        guardTonesfolder = "windowsSimulationsResults\Master\multi-signal\largos\guardtones\";            
end

%% 2db
folder = strcat(guardTonesfolder, "2db\");
guardTonesConfig.SNR_dB = "2"; %dB
for i = 1:3
    folder = strcat(folder, num2str(i), '\');
    guardTonesSim(guardTonesConfig, folder);
    folder = strcat(guardTonesfolder, "2db\");
end

%% 5db
folder = strcat(guardTonesfolder, "5db\");
guardTonesConfig.SNR_dB = "5"; %dB
for i = 1:3
    folder = strcat(folder, num2str(i), '\');
    guardTonesSim(guardTonesConfig, folder);
    folder = strcat(guardTonesfolder, "5db\");
end

%% 10db
folder = strcat(guardTonesfolder, "10db\");
guardTonesConfig.SNR_dB = "10"; %dB
for i = 1:3
    folder = strcat(folder, num2str(i), '\');
    guardTonesSim(guardTonesConfig, folder);
    folder = strcat(guardTonesfolder, "10db\");
end
fprintf("FINISHED GUARDTONES")

%% multipath - Different filters and multipath models - 2 tones distance

switch signalLengthConfig.flag
    case lengthEnum.estreito
        multipathfolder = "windowsSimulationsResults\Master\multi-signal\estreitos\multipath\";
    case lengthEnum.medio
        multipathfolder = "windowsSimulationsResults\Master\multi-signal\medios\multipath\";
    case lengthEnum.largo
        multipathfolder = "windowsSimulationsResults\Master\multi-signal\largos\multipath\";            
end

%% none
folder = strcat(multipathfolder, "none\");
multipathConfig.multipath = "NONE"; %dB
for i = 1:3
    folder = strcat(folder, num2str(i), '\');
    multipathSim(multipathConfig, folder);
    folder = strcat(multipathfolder, "none\");
end

%% typical urban
folder = strcat(multipathfolder, "typical_urban\");
multipathConfig.multipath = "TYPICAL_URBAN"; %dB
for i = 1:3
    folder = strcat(folder, num2str(i), '\');
    multipathSim(multipathConfig, folder);
    folder = strcat(multipathfolder, "typical_urban\");
    
end

%% rural area
folder = strcat(multipathfolder, "rural_area\");
multipathConfig.multipath = "RURAL_AREA"; %dB
for i = 1:3
    folder = strcat(folder, num2str(i), '\');
    multipathSim(multipathConfig, folder);
    folder = strcat(multipathfolder, "rural_area\");
end

%% Shift - Second signal is delayed. 1 tone distance.

switch signalLengthConfig.flag
    case lengthEnum.estreito
        shiftFolder = "windowsSimulationsResults\Master\multi-signal\estreitos\shift\";
    case lengthEnum.medio
        shiftFolder = "windowsSimulationsResults\Master\multi-signal\medios\shift\";
    case lengthEnum.largo
        shiftFolder = "windowsSimulationsResults\Master\multi-signal\largos\shift\";            
end

%% 100th-symbol delay
folder = strcat(shiftFolder, "100th-symbol\");
shiftConfig.shift = shiftEnum.hundredth;
for i = 1:3
    folder = strcat(folder, num2str(i), '\');
    shiftSim(shiftConfig, folder);
    folder = strcat(shiftFolder, "100th-symbol\");
end

%% half-symbol delay
folder = strcat(shiftFolder, "half-symbol\");
shiftConfig.shift = shiftEnum.half;
for i = 1:3
    folder = strcat(folder, num2str(i), '\');
    shiftSim(shiftConfig, folder);
    folder = strcat(shiftFolder, "half-symbol\");
end

%% quarter-symbol delay
folder = strcat(shiftFolder, "quarter-symbol\");
shiftConfig.shift = shiftEnum.quarter;
for i = 1:3
    folder = strcat(folder, num2str(i), '\');
    shiftSim(shiftConfig, folder);
    folder = strcat(shiftFolder, "quarter-symbol\");
end








