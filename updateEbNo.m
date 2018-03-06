function updateEbNo( EbNo )
    %UPDATEPARAMETERFILE Updates HERMES's parameters file
    %   Updates line 60 of the "generalSimulationSettings.m" parameters
    %   file, changing the desired SNR in dB.
    % Read txt into cell A
    fid = fopen('parameters/generalSimulationSettings.m', 'r');
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
    str = strcat('SETTINGS.SNR.VECTOR_dB =',num2str(EbNo),';');
    A{60} = sprintf('%s',str);
    % Write cell A into txt
    fid = fopen('parameters/generalSimulationSettings.m', 'w');
    for i = 1:numel(A)
        if A{i+1} == -1        
            fprintf(fid,'%s\n', A{i});
            break
        else
            fprintf(fid,'%s\n', A{i});        
        end
    end
end

