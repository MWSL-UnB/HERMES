function updateSignalLength( fft_size, subcarriers, spacing, transport_block_size_bits, drops_duration  )
    %UPDATEPARAMETERFILE Updates HERMES's parameters file
    %   Updates lines 26, 28 and 31 of the "fiveGSimulationSettings.m" parameters
    %   file, changing the signal length.
    %   update5GWaveform(fft size, useful subcarriers, subcarriers spacing, transport block size bits)
    %   Author: Lucas Baião Pires
    % Read txt into cell A	
	
    if mod(fft_size, 1) == 0 && mod(subcarriers, 1) == 0 && mod(spacing, 1) ==0 && mod(transport_block_size_bits, 1) == 0

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
        spacingLine = strcat('FIVEG.SUBCARRIER_SPACING = ',num2str(spacing),';');
        A{26} = sprintf('%s',spacingLine); %line number
        fftSizeLine = strcat('FIVEG.FFT_SIZE = ',num2str(fft_size),';');
        A{28} = sprintf('%s', fftSizeLine); %line number
        subcarriersLine = strcat('FIVEG.USEFUL_SUBCARRIERS = ',num2str(subcarriers),';');
        A{31} = sprintf('%s',subcarriersLine); %line number
        transportLine = strcat('FIVEG.TRANSPORT_BLOCK_SIZE_BITS = ',num2str(transport_block_size_bits),';');
        A{112} = sprintf('%s',transportLine); %line number
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
        dropsDurationLine = strcat('SETTINGS.DROPS.DURATION = ', num2str(drops_duration), ';');
        A{24} = sprintf('%s',dropsDurationLine); %line number
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


    else
        
        error("updateSignalLength invalid option \n")
        
    end
    
end

