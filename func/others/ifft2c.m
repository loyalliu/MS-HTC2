function res = ifft2c(x)
% Calculate 2 dimension fast inverse Fourier transform 
%
%     Args:
%         x(ND)           : Time domain/image space data
%     Return:
%         res(Nd)         : Frequency domain/k space data
%     Warning: 
%         Inverse Fourier transform is along dim 1 & 2.
% (c) Zheyuan_Yi 2018

%% ifft
S = size(x);
fctr = S(1)*S(2);

x = reshape(x,S(1),S(2),prod(S(3:end)));

res = zeros(size(x));
for n=1:size(x,3)
res(:,:,n) = sqrt(fctr)*fftshift(ifft2(ifftshift(x(:,:,n))));
end


res = reshape(res,S);

end