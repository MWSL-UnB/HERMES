switch fWindow
    case "rect"        
        filterInTime = prototypeInTime; 
    case "hann"
        window = hanning(filterSize)'; % Hanning window        
        filterInTime = prototypeInTime.*window; 
    case "hamm"
        window = hamming(filterSize)'; % Hamming window        
        filterInTime = prototypeInTime.*window; 
    case "black"
        window = blackman(filterSize)'; % Blackman window        
        filterInTime = prototypeInTime.*window; 
    case "kaiser"
        window = kaiser(filterSize)'; % Kaiser window        
        filterInTime = prototypeInTime.*window; 
    case "cheb"
        window = chebwin(filterSize)'; % Chebyshev window        
        filterInTime = prototypeInTime.*window; 
    case "gauss"
        window = gausswin(filterSize)'; % Gauss window        
        filterInTime = prototypeInTime.*window; 
    otherwise
        window = hanning(filterSize)'; % Hanning window        
        filterInTime = prototypeInTime.*window; 
end