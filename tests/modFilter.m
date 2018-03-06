function [absFilter] = modFilter (filter)
    absFilter = 20*log10(abs(filter));
end