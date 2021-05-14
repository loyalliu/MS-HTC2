function res = sos(x ,dim, pnorm)
% Computes the square root of sum of squares along dimension dim
%
%     Args:
%         x(ND)   : Input data
%         dim     : Along specified dimension 
%         pnorm   : Power root and sum of power (default = 2)
%     Return:
%         res(ND) : Square root of sum of squares data
%     Warning: 
%         Computes along the last dimension if 'dim' not specified  
% (c) Zheyuan_Yi 2018

%% Input check
if nargin < 3
    pnorm = 2;
    if nargin < 2
        dim = ndims(x);
    end
end

%% SoS
res = (sum(abs(x.^pnorm),dim)).^(1/pnorm);

end
