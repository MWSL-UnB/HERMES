function [gBSimResults] = gBSim(maxGuardBand, snrdB, pointsCount)

    %% Initialize gBSimResults struct

    gBSimResults.signalBand = 99e6;     %signal bandwidth. Both signals have the same bandwidth
    gBSimResults.guardBand = maxGuardBand;      %guardband between signals. 1 tone = 15e3.
    gBSimResults.carriersDistance = gBSimResults.signalBand + gBSimResults.guardBand;       % max distance between signals' center frequencies
    gBSimResults.evaluatedEbNo = snrdB;        %Eb/No ratio for which the BER will be stored    
    numberOfPoints = pointsCount;

    % vector that contains distance between signals' center frequencies that
    % will be simulated

    % uncomment this to simulate in function of the distance between central
    % frequencies
    % gBSimResults.CarriersDistancesVector = 0:(gBSimResults.carriersDistance/10):gBSimResults.carriersDistance;      

    % uncomment this to simulate in function of the guarband between signals
    gBSimResults.CarriersDistancesVector = gBSimResults.signalBand:(gBSimResults.guardBand/numberOfPoints):gBSimResults.carriersDistance;      

    % Initializing BER, BLER and Throughput vectors, that will store the results
    gBSimResults.BERVector = zeros(1, length(gBSimResults.CarriersDistancesVector));
    gBSimResults.BLERVector = zeros(1, length(gBSimResults.CarriersDistancesVector));
    gBSimResults.ThroughputVector = zeros(1, length(gBSimResults.CarriersDistancesVector));


    %% Main loop where ther HERMES is executed and the interesting values are
    %%stored
    updateEbNo(gBSimResults.evaluatedEbNo) %updates the simulated SNR

    for i = 1:1:length(gBSimResults.CarriersDistancesVector)    

        %updates the simulated guardband
        updateGuardBand(gBSimResults.CarriersDistancesVector(i));
        fprintf('iteration: %d\n', i)

        %executes HERMES
        hermes    

        % stores each simulation's results into the gBSimResults struct
        gBSimResults.BERVector(i) = statistics.berMean;
        gBSimResults.BLERVector(i) = statistics.blerMean;
        gBSimResults.ThroughputVector(i) = statistics.throughput;           
    end


    %%  Save results

    % Fetch simulation parameters
    gBSimResults = gBSimSaveResults(gBSimResults);

    % % Initialize results folder
    % if( ~exist( 'resultsDirectory', 'var') ) || isempty( resultsDirectory )
    %     resultsDirectory = [ 'gBSimResults', filesep,  ...
    %                          datestr( clock, 'yyyy-mm-dd_HH-MM-SS' ) ];
    % end
    % 
    % % Create output File / Directory ( if the specified path does not exist ).
    % mkdir( resultsDirectory );
    % 
    % % Initialize seed
    % if ( ~exist('seed', 'var') )
    %     seed = sum( 1000*clock );
    % end
    % 
    % % Convert to integer when seed parameter is set on deployed mode (compiled)
    % if ( ischar( seed ) )
    %     seed = str2double( seed );
    % end
    % 
    % % Save gBSimResults struct, which contains the simulation results.
    % save( [ resultsDirectory, filesep, ...
    %       'gBSimResults_' num2str(seed) '.mat' ], 'gBSimResults' );
    %   
    % clear resultsDirectory;
    % 
    % beep;

end
