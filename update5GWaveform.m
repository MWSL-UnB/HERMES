function update5GWaveform( waveform )
    %UPDATEPARAMETERFILE Updates HERMES's parameters file
    %   Updates line 34 of the "fiveGSimulationSettings.m" parameters
    %   file, changing the desired guardband between signals.
    %   Options are "FOFDM", "OFDM", "FBMC"
    % Read txt into cell A	
	
    if ismember(waveform, ["FOFDM", "OFDM"])

        fid = fopen('parameters/fiveGSimulationSettings.m', 'r');
        i = 1;
        tline = fgetl(fid);
        A{i} = tline;
        while ischar(tline)
            i = i+1;
            tline = fgetl(fid);
            A{i} = tline;
        end
        fclose(fid);
        % Change cell A    
        str = strcat('FIVEG.WAVEFORM.TYPE = enum.modem.fiveG.Waveform.',waveform,';');
        A{34} = sprintf('%s',str); %line number
        % Write cell A into txt
        fid = fopen('parameters/fiveGSimulationSettings.m', 'w');
        for i = 1:numel(A)
            if A{i+1} == -1        
                fprintf(fid,'%s\n', A{i});
                break
            else
                fprintf(fid,'%s\n', A{i});        
            end
        end    
    else
        
        fprintf("update5GWaveform invalid option \n")
        
    end
    
end

