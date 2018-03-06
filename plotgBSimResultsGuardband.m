function plotgBSimResultsGuardband( gBSimResults )
%PLOTGBSIMRESULTS Summary of this function goes here
%   Detailed explanation goes here
figure(1)
semilogy(gBSimResults.CarriersDistancesVector - gBSimResults.signalBand, ...
     gBSimResults.BERVector, '--*')
grid on
str = sprintf('BER - Technology: %s Waveform: %s Eb/No = %d',...
    gBSimResults.simulationParamters.technology, gBSimResults.simulationParamters.waveform, ...
    gBSimResults.evaluatedEbNo);
title(str)
xlabel('Guardband (Hz)')
ylabel('BER')

figure(2)
semilogy(gBSimResults.CarriersDistancesVector - gBSimResults.signalBand, ...
     gBSimResults.BLERVector, '--*')
grid on
str = sprintf('BLER - Technology: %s Waveform: %s Eb/No = %d',...
    gBSimResults.simulationParamters.technology, gBSimResults.simulationParamters.waveform, ...
    gBSimResults.evaluatedEbNo);
title(str)
xlabel('Guardband (Hz)')
ylabel('BLER')

end

