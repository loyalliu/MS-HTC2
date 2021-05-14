function res = cropp(x,cx)
% Crop N dimensional matrix arround its center
%
%     Args:
%         x(Nd)     : Uncropped data
%         cx(1,M)   : Size of data after cropping
%     Return:
%         res(<=ND) : Cropped data
%     Warning: 
%         1. Dimension size not specified or equals '1' will be squeezed   
%         2. crop([1 2 3 4 5],[2]) = [3 4]
% (c) Zheyuan_Yi 2018

%% Input check
if nargin ~= 2 
	error('must have a target size')
end

%%  specify the size of cropping
    sx = size(x); N =length(sx);M = length(cx);
    if  M < N
	    cx = [cx, ones(1,N-M)];
        if sx(1) == 1
            cx = fliplr(cx); M = 2;
        end
        if M == 1
            M = 2;
        end
    end
    
if sum(sx<cx)>0
    error('size after cropping must not larger than before')
end
    
%%  cropping
    idx = '';
    for n = 1:M
        if mod(sx(n),2)          
            idx = sprintf('%s,%d:%d',idx,ceil(sx(n)/2)+1+floor(-cx(n)/2),ceil(sx(n)/2)+floor(cx(n)/2));             
        else
            idx = sprintf('%s,%d:%d',idx,floor(sx(n)/2)+1+ceil(-cx(n)/2),floor(sx(n)/2)+ceil(cx(n)/2));
        end
    end
    res = sprintf('res = squeeze(x(%s));',idx(2:end));
    eval(res);

end