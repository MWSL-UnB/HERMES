function updateMultipath( multipath )
    %UPDATEPARAMETERFILE Updates HERMES's parameters file
    %   Updates lines 167 and 178 of the "generalSimulationSettings.m" parameters
    %   file. Applies COST_259 multipaths or none.
    %   Options are "NONE", "HILLY_TERRAIN", "RURAL_AREA", "TYPICAL_URBAN"
    % Read txt into cell A	
	
    if ismember(multipath , ["NONE", "HILLY_TERRAIN", "RURAL_AREA", "TYPICAL_URBAN"])                
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
            
            if multipath == "NONE"
                % Change cell A    
                str = 'SETTINGS.CHANNEL.MULTIPATH.MODEL = enum.channel.MultipathModel.NONE;';
                A{167} = sprintf('%s',str); %line number
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
                % Change cell A    
                A{167} = 'SETTINGS.CHANNEL.MULTIPATH.MODEL = enum.channel.MultipathModel.COST259;';
                str = strcat('SETTINGS.CHANNEL.MULTIPATH.COST259.TYPE = enum.channel.Cost259.',multipath,';');                
                A{178} = sprintf('%s',str); %line number
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
    else
        error("updateMultipath invalid option \n")
    end
    

end

