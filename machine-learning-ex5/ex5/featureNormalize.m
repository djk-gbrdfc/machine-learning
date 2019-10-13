function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

mu = mean(X);
X_norm = bsxfun(@minus, X, mu);
%minus是指将左矩阵减右矩阵
sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);
%rdivide是指将左矩阵点除右矩阵
%这个模块实现特征缩放的功能，与作业EX1其中一个模块相同
% ============================================================

end
