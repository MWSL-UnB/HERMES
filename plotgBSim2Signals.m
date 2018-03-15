function plotgBSim2Signals( gBSim1, gBSim2 )
%PLOTGBSIM2SIGNALS Summary of this function goes here
%   Detailed explanation goes here

figure(1)
semilogy(gBSim1.CarriersDistancesVector - gBSim1.signalBand, gBSim1.BERVector, '--*', ...
     gBSim2.CarriersDistancesVector - gBSim2.signalBand, gBSim2.BERVector, '--o')
grid on
str = sprintf('BER - Technology: %s Waveforms: %s and %s Eb/No = %s',...
    gBSim1.simulationParamters.technology, gBSim1.simulationParamters.waveform, ...
    gBSim2.simulationParamters.waveform, gBSim1.evaluatedEbNo);
title(str)
xlabel('Guardband (Hz)')
ylabel('BER')
legend(gBSim1.simulationParamters.waveform, gBSim2.simulationParamters.waveform)

% figure(2)
% semilogy(gBSim1.CarriersDistancesVector - gBSim1.signalBand, gBSim1.BLERVector, '--*', ...
%      gBSim2.CarriersDistancesVector - gBSim2.signalBand, gBSim2.BLERVector, '--o')
% grid on
% str = sprintf('BLER - Technology: %s Waveforms: %s and %s Eb/No = %d',...
%     gBSim1.simulationParamters.technology, gBSim1.simulationParamters.waveform, ...
%     gBSim2.simulationParamters.waveform, gBSim1.evaluatedEbNo);
% title(str)
% xlabel('Guardband (Hz)')
% ylabel('BLER')
% legend(gBSim1.simulationParamters.waveform, gBSim2.simulationParamters.waveform)

end

