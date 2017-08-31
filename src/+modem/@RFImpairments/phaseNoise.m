function [outputSignal] = phaseNoise(this, rxSignal, variance, ratio, subcarrierSpacing, fftSize)
% Introduces the phase noise at the receptor. The phase noise is modelled
% as a zero mean Gaussian random process with the specified variance.
% 
% The parameters are: rxSignal - signal at the receptor
%                     variance - the variance of the phase noise
%                     ratio - defined as B_phi/(subcarrier spacing)
%

%% Defining the phase noise's bandwidth
B_phi = subcarrierSpacing*ratio; % Phase noise bandwidth

fs = subcarrierSpacing*fftSize; % Sampling frequency

%% Generating the phase noise 
std = sqrt(variance);

whitePhaseNoise = std*randn(size(rxSignal)); 

%% Filtering the phase noise to the specified bandwidth
% Filter in the frequency domain
f = [0:(fs + 1)/fftSize:fs]; 
filterInFrequency = rectangularPulse(0, B_phi/2, f) + rectangularPulse(fs - B_phi/2, fs, f); % Rectangular pulses from 0 to B_phi/2 and from (B_phi/2-fs) to fs

% Filter in the time domain
filterInTime = ifft(filterInFrequency);
filterInTime = fftshift(filterInTime);

% Filtering
phaseNoise = conv(whitePhaseNoise, filterInTime);
phaseNoise = phaseNoise(fftSize/2:length(phaseNoise)-fftSize/2); % Removing the extra samples after filtering

%% Adding the phase noise to the received signal
outputSignal = rxSignal.*exp(1i*phaseNoise);

 

