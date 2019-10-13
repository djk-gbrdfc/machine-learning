function p = multivariateGaussian(X, mu, Sigma2)
%MULTIVARIATEGAUSSIAN Computes the probability density function of the
%multivariate gaussian distribution.
%    p = MULTIVARIATEGAUSSIAN(X, mu, Sigma2) Computes the probability 
%    density function of the examples X under the multivariate gaussian 
%    distribution with parameters mu and Sigma2. If Sigma2 is a matrix, it is
%    treated as the covariance matrix. If Sigma2 is a vector, it is treated
%    as the \sigma^2 values of the variances in each dimension (a diagonal
%    covariance matrix)
% 多变量高斯分布计算多元高斯分布的概率密度函数。
% p = MULTIVARIATEGAUSSIAN(X, mu, Sigma2)在参数为mu和Sigma2的多元高斯分布下，
% 计算样本X的概率密度函数。如果Sigma2是一个矩阵，则将其视为协方差矩阵。
% 如果Sigma2是一个向量，则它被视为每个维度的方差的\sigma^2值(一个对角协方差矩阵)

k = length(mu);

if (size(Sigma2, 2) == 1) || (size(Sigma2, 1) == 1)
    Sigma2 = diag(Sigma2);
end

% x = x - μ
X = bsxfun(@minus, X, mu(:)');
% det函数是求一个方阵的行列式
% p = e^(((-X * (Sigma2)^(-1) .* X) + 2) / 2) / (2Πσ?^(k/2))
% 多元高斯分布（多元正态分布）
p = (2 * pi) ^ (- k / 2) * det(Sigma2) ^ (-0.5) * ...
    exp(-0.5 * sum(bsxfun(@times, X * pinv(Sigma2), X), 2));

end