function [ rxSignalOut ] = combiner( this, rxSignal, channelInFreq )
% Alamouti combining scheme for one receiving antenna and 2 transmitting
% antennas.

%% Parameters (olhar fillFrame e escolher o mesmo)
space_time = 1; 
space_frequency = 0;

numberOfRxAntennas = size(rxSignal, 3);

%% RX signal after the combiner
rxSignalOut =zeros(size(rxSignal(:,:,1)));

if(space_time == 1 && space_frequency == 0)
    %% For STBC
    for i = 1:1:size(rxSignal,1) % Lines 
        for j = 1:2:size(rxSignal,2)-1 % Columns 
            for rxAntCount = 1:1:numberOfRxAntennas
              
                currentCombiner1 = (conj(channelInFreq(i,j,rxAntCount,1)))*rxSignal(i,j,rxAntCount)+...
                                    channelInFreq(i,j,rxAntCount,2)*conj(rxSignal(i,j+1,rxAntCount));
                currentCombiner2 = (conj(channelInFreq(i,j,rxAntCount,2)))*rxSignal(i,j,rxAntCount)-...
                                    channelInFreq(i,j,rxAntCount,1)*conj(rxSignal(i,j+1,rxAntCount));
                                
                rxSignalOut(i,j) = rxSignalOut(i,j) + currentCombiner1;
                rxSignalOut(i,j+1) = rxSignalOut(i,j+1) + currentCombiner2;
                  
            end
            %rxSignalOut(i,j) = (conj(channelInFreq(i,j,:, 1))*rxSignal(i,j) + ...
            %            channelInFreq(i,j,:, 2)*conj(rxSignal(i,j+1)));
            %rxSignalOut(i,j+1) = (conj(channelInFreq(i,j,:, 2))*rxSignal(i,j) - ...
            %              channelInFreq(i,j,:, 1)*conj(rxSignal(i,j+1)));
        end 
    end
elseif(space_time == 0 && space_frequency == 1)
    %% For SFBC
    for j = 1:1:size(rxSignal,2) % Columns
            for i = 1:2:size(rxSignal,1)-1 % Lines
                rxSignalOut(i,j) = conj(channelInFreq(i,j,:, 1))*rxSignal(i,j) + ...
                           channelInFreq(i,j,:, 2)*conj(rxSignal(i+1,j));
                rxSignalOut(i+1,j) =  conj(channelInFreq(i,j,:, 2))*rxSignal(i,j) - ...
                           channelInFreq(i,j,:, 1)*conj(rxSignal(i+1,j));
            end
    end
else
    display('Error. Choose either STBC or SFBC.')
end