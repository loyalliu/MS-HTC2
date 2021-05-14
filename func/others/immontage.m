function immontage(img,range,shape)
% Display series of images as a montage.
%
%     Args:
%         x(ND)      : Input images in series
%         shape(1,2) : The shape of the montage
%         range(1,2) : Window level (similarly to imshow) 
%     Inputs(easy mode):
%         Variable name 
%     Return:
%         Imshow the montage image
%     Warning: 
%         Dimension after second will all treat as series  
%         Range will auto-determined to [min max] if not specified
%         Shape will be auto-padded to square if not specified
% (c) Zheyuan_Yi 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For multi-contrast project, delete in appropriate
% global Project
% global MC_num
% if strcmp(Project,'MultiContrast')
%     shape =  MC_num;
% end


%% Input check
% Input easy mode
if nargin == 0
    str = input('VarName: ','s');
    img = evalin('caller',str);    
end

img = img(:,:,:);
[sx,sy,nc] = size(img);

% specify display range
if nargin < 2 
    if min(abs(img(:)))~= max(abs(img(:)))
    	range = [min(abs(img(:))), max(abs(img(:)))];
    else
        range = [0 1];
    end
end



% specify shape of display
if ~exist('shape','var') 
    
	if ceil(sqrt(nc))^2 ~= nc %#ok<ALIGN>
        nc = ceil(sqrt(nc))^2;
        img(end,end,nc)=0;
    end      
    
	img = reshape(img,sx,sy*nc);
	img = permute(img,[2,3,1]);
	img = reshape(img,sy*sqrt(nc),sqrt(nc),sx);
	img = permute(img,[3,2,1]);
	img = reshape(img,sx*sqrt(nc),sy*sqrt(nc));
    
else
    
    
	img = reshape(img,sx,sy*nc);
	img = permute(img,[2,3,1]);
	img = reshape(img,sy*shape(2),shape(1),sx);
	img = permute(img,[3,2,1]);
	img = reshape(img,sx*shape(1),sy*shape(2));
end

%% Display
imshow(abs(img),'DisplayRange',range);

end
