function updateGuardBand( newLine )
    %UPDATEPARAMETERFILE Updates HERMES's parameters file
    %   Updates line 141 of the "generalSimulationSettings.m" parameters
    %   file, changing the desired guardband between signals.
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
    guardband = newLine;
    str = strcat('SETTINGS.SCENARIO.CARRIERS_DISTANCE =',num2str(guardband),';');
    A{141} = sprintf('%s',str);
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

