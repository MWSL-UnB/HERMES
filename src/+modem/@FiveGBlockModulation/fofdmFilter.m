function [filterInTime] = fofdmFilter (this, filterOrder, fWindow)

filterInTime = fir1(filterOrder, 0.8, 'low', hann(filterOrder + 1));

end



% Normalizing the filter 
%[sum, ~] = sumsqr(filterInTime); % sum is the squared sum of all of filterInTime's coefficients
%filterInTime = (filterInTime)./sqrt(sum); % After normalizing, the squared sum of filterInTime's coefficients is equal to 1
