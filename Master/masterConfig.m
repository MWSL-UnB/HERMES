%% models

%medio
medio.fftSize = 512;
medio.usefulSubcarriers =  400;
medio.subcarriersSpacing = 15e3;
medio.TransportBlockSizeBits = 2000;
medio.dropsDuration = 0.005;
medio.flag = lengthEnum.medio;

%largo
largo.fftSize = 2048;
largo.usefulSubcarriers =  1650;
largo.subcarriersSpacing = 15e3;
largo.TransportBlockSizeBits = 4000;
largo.dropsDuration = 0.005;
largo.flag = lengthEnum.largo;

%estreito
estreito.fftSize = 64;
estreito.usefulSubcarriers =  32;
estreito.subcarriersSpacing = 15e3;
estreito.TransportBlockSizeBits = 125;
estreito.dropsDuration = 0.16;
estreito.flag = lengthEnum.estreito;

%% signalLengthConfig
signalLengthConfig = medio;

%% guardbandConfig
guardbandConfig.signalBand = signalLengthConfig.subcarriersSpacing * signalLengthConfig.usefulSubcarriers;     %signal bandwidth. Both signals have the same bandwidth

%% guardTonesConfig
guardTonesConfig.signalBand = signalLengthConfig.subcarriersSpacing * signalLengthConfig.usefulSubcarriers;
guardTonesConfig.points = 12;
guardTonesConfig.maxGuardband = 15e3;

%% multipathConfig
multipathConfig.signalBand = signalLengthConfig.subcarriersSpacing * signalLengthConfig.usefulSubcarriers;
multipathConfig.guardband = 15e3; %1 tone = 15e3
multipathConfig.carriersDistance = multipathConfig.guardband + multipathConfig.signalBand;

%% shiftConfig
shiftConfig.signalBand = signalLengthConfig.subcarriersSpacing * signalLengthConfig.usefulSubcarriers;
shiftConfig.guardband = 15e3; %1 tone = 15e3
shiftConfig.carriersDistance = multipathConfig.guardband + multipathConfig.signalBand;