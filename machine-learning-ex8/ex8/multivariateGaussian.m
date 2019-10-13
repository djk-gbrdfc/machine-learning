function p = multivariateGaussian(X, mu, Sigma2)
%MULTIVARIATEGAUSSIAN Computes the probability density function of the
%multivariate gaussian distribution.
%    p = MULTIVARIATEGAUSSIAN(X, mu, Sigma2) Computes the probability 
%    density function of the examples X under the multivariate gaussian 
%    distribution with parameters mu and Sigma2. If Sigma2 is a matrix, it is
%    treated as the covariance matrix. If Sigma2 is a vector, it is treated
%    as the \sigma^2 values of the variances in each dimension (a diagonal
%    covariance matrix)
% �������˹�ֲ������Ԫ��˹�ֲ��ĸ����ܶȺ�����
% p = MULTIVARIATEGAUSSIAN(X, mu, Sigma2)�ڲ���Ϊmu��Sigma2�Ķ�Ԫ��˹�ֲ��£�
% ��������X�ĸ����ܶȺ��������Sigma2��һ������������ΪЭ�������
% ���Sigma2��һ����������������Ϊÿ��ά�ȵķ����\sigma^2ֵ(һ���Խ�Э�������)

k = length(mu);

if (size(Sigma2, 2) == 1) || (size(Sigma2, 1) == 1)
    Sigma2 = diag(Sigma2);
end

% x = x - ��
X = bsxfun(@minus, X, mu(:)');
% det��������һ�����������ʽ
% p = e^(((-X * (Sigma2)^(-1) .* X) + 2) / 2) / (2����?^(k/2))
% ��Ԫ��˹�ֲ�����Ԫ��̬�ֲ���
p = (2 * pi) ^ (- k / 2) * det(Sigma2) ^ (-0.5) * ...
    exp(-0.5 * sum(bsxfun(@times, X * pinv(Sigma2), X), 2));

end