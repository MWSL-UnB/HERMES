clear all;
%% Filters

fftSize = 512;
truncatingPoint = 10;
space = 1:fftSize;

x = -truncatingPoint:2*truncatingPoint/fftSize:truncatingPoint-1/fftSize;

rectFilter = sinc(x);
hannFilter = sinc(x).*hann(fftSize)';
hammFilter = sinc(x).*hamming(fftSize)';
blackFilter = sinc(x).*blackman(fftSize)';
kaiserFilter = sinc(x).*kaiser(fftSize)';
chebFilter = sinc(x).*chebwin(fftSize)';
gaussFilter = sinc(x).*gausswin(fftSize)';

%% Plots

figure(1)
plot(sinc(x));

figure(2)
grid on

plot(space, modFilter(rectFilter), ...
     space, modFilter(hannFilter), ...
     space, modFilter(blackFilter), ...
     space, modFilter(kaiserFilter))
 legend("Rectangular", ...
        "Hanning", ...
        "Blackman", ...
        "Kaiser")
    
 title("FIR Filters Impulse response")
 ylabel("Impulse Response [dB]")
 xlabel("Samples")
 ylim([-180 0])
 
 fvtool(rectFilter, 1, ...
       hannFilter, 1, ...
       blackFilter, 1, ...
       gaussFilter, 1)
 legend("Rectangular", ...
        "Hanning", ...
        "Blackman", ...
        "Kaiser")
 xlim([0 0.25])
   
 %% Comparison
   
%  c.value = modFilter(rectFilter(fftSize));
%  c.filter = "rect";
%  compare{1} = c;
%  c.value = modFilter(hannFilter(fftSize));
%  c.filter = "hann";
%  compare{2} = c;
%  c.value = modFilter(hammFilter(fftSize));
%  c.filter = "hamm";
%  compare{3} = c;
%  c.value = modFilter(blackFilter(fftSize));
%  c.filter = "black";
%  compare{4} = c;
%  c.value = modFilter(kaiserFilter(fftSize));
%  c.filter = "kaiser";
%  compare{5} = c;
%  c.value = modFilter(chebFilter(fftSize));
%  c.filter = "cheb";
%  compare{6} = c;
%  c.value = modFilter(gaussFilter(fftSize));
%  c.filter = "gauss";
%  compare{7} = c;
%  
%  m = compare{1};
%  
%  for i=2:7
%      if(m.value<compare{i}.value)
%          m.value = compare{i}.value;
%          m.filter = compare{i}.filter;
%      end          
%  end 
 
 
 
 
 
%  plot(space, modFilter(rectFilter), ...
%      space, modFilter(hannFilter), ...
%      space, modFilter(hammFilter), ...
%      space, modFilter(blackFilter), ...
%      space, modFilter(kaiserFilter), ...
%      space, modFilter(chebFilter), ...
%      space, modFilter(gaussFilter))
%  legend("rectFilter", ...
%         "hannFilter", ...
%         "hammFilter", ...
%         "blackFilter", ...
%         "kaiserFilter", ...
%         "chebFilter", ...
%         "gaussFilter")

% fvtool(rectFilter, 1, ...
%        hannFilter, 1, ...
%        hammFilter, 1, ...
%        blackFilter, 1, ...
%        kaiserFilter, 1, ...
%        chebFilter, 1, ...
%        gaussFilter, 1)
   
   
 

