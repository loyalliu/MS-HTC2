function Param = ParamSetting_MSHTC
% List of parameters

% MSHTC Parameter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
Param.MSHTC.Iter = 400; % Iteration number

Param.MSHTC.thresh_kernel = 30; % threshold of joint recon in kernel
Param.MSHTC.thresh_coil = 26; % threshold of joint recon in coil
Param.MSHTC.thresh_slice = 2; % threshold of joint recon in coil
Param.MSHTC.incre_stopRank_kernel = 60;% the end rank of kernel 
Param.MSHTC.incre_stopRank_coil = 125;% the end rank of coil
Param.MSHTC.incre_stopRank_slice = 2;% the end rank of slice

Param.MSHTC.incre_Rank_kernel = 1;% the increment unit of rank 
Param.MSHTC.incre_Rank_coil = 1;% the increment unit of rank 
Param.MSHTC.incre_Rank_slice = 1;% the increment unit of rank 

Param.MSHTC.incre_Rank_rate_begin_kernel = 8;% the increment rate of rank 
Param.MSHTC.incre_Rank_rate_begin_coil = 32;% the increment rate of rank 
Param.MSHTC.incre_Rank_rate_begin_slice = 1;% the increment rate of rank 
Param.MSHTC.incre_Rank_rate_later_kernel = 4;%the increment rate of rank 
Param.MSHTC.incre_Rank_rate_later_coil = 12;%the increment rate of rank 
Param.MSHTC.incre_Rank_rate_later_slice = 1;%the increment rate of rank 
Param.MSHTC.num_begin_kernel = 2;
Param.MSHTC.num_begin_coil = 2;
Param.MSHTC.num_begin_slice = 2;

Param.MSHTC.tol_kernel = 5e-4;% tolerance of rank increment
Param.MSHTC.tol_coil = 5e-4;% tolerance of rank increment
Param.MSHTC.tol_slice = 1e-4;% tolerance of rank increment
Param.MSHTC.tol_rate_kernel = 1/5;% tolerance rate of rank increment
Param.MSHTC.tol_rate_coil = 1/5;% tolerance rate of rank increment
Param.MSHTC.tol_rate_slice = 1/5;% tolerance rate of rank increment
Param.MSHTC.ksize = [6,6]; % MSHTC kernel size
Param.MSHTC.displayRange = 0.2; % Residue display range after norm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% DATA parameter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Param.DATA.ns = 2;% num of slice
for i = 1:Param.DATA.ns
    Param.DATA.slice_num{i} = i;% slice selection
    Param.DATA.norm_level{i} = 99.8;
end
Param.DATA.crop_size = 240;% image size of cropping
Param.DATA.sx = Param.DATA.crop_size ;% image size after cropping
Param.DATA.sy = Param.DATA.crop_size ;% image size after cropping
Param.DATA.nc = 8;% num of channel 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
warning('Path setting')
addr = '.\';
masks = '4x1D_Regular240_dir1\';
% mask
Param.addr.mask = [addr 'MS_HTC2\mask\' masks(1:end-1) '.mat'];
% data
for i = 1:Param.DATA.ns
      Param.addr.DATA{i} = [addr 'MS_HTC2\data\T2_TSE_AlterPE.mat'];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end



