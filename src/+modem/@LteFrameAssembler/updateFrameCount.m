function updateFrameCount( this )
%LTEFRAMEASSEMBLER.UPDATEFRAMECOUNT updates the Frame Count.
%   Description at class header
%
%   Author: Rafhael Amorim
%   Work Address: INDT Bras�lia
%   E-mail: rafhael.amorim@indt.org.br
%   History: 
%   	v2.0 5 May 2015 (RA) - created
%
%   Copyright (c) 2015 INDT - Institute of Technology Development.
%
%   The program may be used and/or copied only with the written
%   permission of INDT, or in accordance with the terms and conditions
%   stipulated in the agreement/contract under which the program has been
%   supplied.


this.subframeCount = mod( this.subframeCount , this.numberOfSubframes ) + 1;

end



