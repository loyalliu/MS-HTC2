function Y = giveTSVD(X,thresh)
% Fast svd only calculate rank to threshold
%
%     Args:
%         X(2D)       : Input data 
%         thresh(num) : Threshold to calculate svd
%     Return:
%         u           : Singular vector of row space
%         s           : Singular value within threshold
%         v           : Singular vector of column space
%     Warning: 
%         1. Thresh must be specified   
% (c) Zheyuan_Yi 2018

%% SVD factorization
[v,s] = eigs(X'*X,thresh);
u = X*v;
Y = u*v';

end