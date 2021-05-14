clear all;

addpath(genpath('.\func'));
%% Loading recon parameters
global ParamSetting 
ParamSetting = 'Param = ParamSetting_MSHTC;';

eval(ParamSetting)
%% Data preprocessing
DATA = zeros(Param.DATA.sx,Param.DATA.sy,Param.DATA.nc,Param.DATA.ns);
for ns = 1:Param.DATA.ns
temp = cell2mat(struct2cell(load(Param.addr.DATA{ns})));% load data
temp = squeeze(temp(:,:,Param.DATA.slice_num{ns},:));
temp = cropp(temp,[Param.DATA.crop_size Param.DATA.crop_size Param.DATA.nc]);%crop to specific size
DATA(:,:,:,ns) = temp/prctile(reshape(sos(ifft2c(temp)),[],1),Param.DATA.norm_level{ns}) + eps;% data normalization
end
clear temp ns

% Undersampling
mask = cell2mat(struct2cell(load(Param.addr.mask)));
mask = mask(:,:,1:Param.DATA.ns);
mask = permute(repmat(mask,[1,1,1,Param.DATA.nc]),[1 2 4 3]);
Param.DATA.mask = mask;
DATAc = DATA.*mask;
clear mask 

tempc = ifft2c(DATAc);temp = ifft2c(DATA);
show(:,:,:,1) = squeeze(sos(temp,3));show(:,:,:,2) = squeeze(sos(tempc,3));

%% Perform MS-HTC reconstruction 
disp('Performing MS-HTC');
tmark = tic;
[calib, Param, ratio] = MS_HTC(DATAc, Param, DATA);

show(:,:,:,3) = squeeze(sos(ifft2c(calib),3));
show(:,:,:,4) = squeeze(sos(ifft2c(calib)-ifft2c(DATA),3))/Param.MSHTC.displayRange; 
 
figure,immontage(show,[0 1],[4 Param.DATA.ns]);