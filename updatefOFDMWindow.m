function updatefOFDMWindow( windowName )
    %UPDATEPARAMETERFILE Updates HERMES's parameters file
    %   Updates line 141 of the "generalSimulationSettings.m" parameters
    %   file, changing the desired guardband between signals.
    % Read txt into cell A	
	
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
    A{34} = 'FIVEG.WAVEFORM.TYPE = enum.modem.fiveG.Waveform.FOFDM;';
    str = strcat('FIVEG.FOFDMWINDOW = ','"' ,windowName,'"',';');
    A{77} = sprintf('%s',str); %line number
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
end

