function updateShift( shift )
    %UPDATEPARAMETERFILE Updates HERMES's parameters file
    %   Updates line 141 of the "generalSimulationSettings.m" parameters
    %   file, changing the desired guardband between signals.
    % Read txt into cell A
    fid = fopen('src/+simulatorCore/@DropLoop/runLoop.m', 'r');
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
    switch shift
        case shiftEnum.hundredth
            newLine = 100;
            str = strcat('txSignal{2} = circshift(txSignal{2}, ceil(length(txSignal{2})/', num2str(newLine), '));');
        case shiftEnum.half
            newLine = 2;
            str = strcat('txSignal{2} = circshift(txSignal{2}, ceil(length(txSignal{2})/', num2str(newLine), '));');
        case shiftEnum.quarter
            newLine = 4;
            str = strcat('txSignal{2} = circshift(txSignal{2}, ceil(length(txSignal{2})/', num2str(newLine), '));');
        case shiftEnum.none
            str = strcat('% txSignal{2} = circshift(txSignal{2}, ceil(length(txSignal{2})/2));');
        otherwise
            error('Invalid updateShift parameter');
    end    
    A{76} = sprintf('%s',str);
    % Write cell A into txt
    fid = fopen('src/+simulatorCore/@DropLoop/runLoop.m', 'w');
    for i = 1:numel(A)
        if A{i+1} == -1        
            fprintf(fid,'%s\n', A{i});
            break
        else
            fprintf(fid,'%s\n', A{i});        
        end
    end
end

