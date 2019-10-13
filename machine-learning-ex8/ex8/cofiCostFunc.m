function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

% 说明:计算协同过滤的成本函数和梯度。具体来说，您应该首先实现成本函数(不需要正则化)，
% 并确保它与我们的成本相匹配。之后，您应该实现梯度并使用checkCostFunction例程检查梯度是否正确。
% 最后，应该实现正则化。
%
% 注释:X - num_movies X num_features电影特性矩阵
% Theta - num_users x num_features用户特征矩阵
% Y - num_movies x num_users用户电影评分矩阵
% R - num_movies x num_users矩阵，其中R(i, j) = 1，如果第i个电影被第j个用户评分
%
% 你应该正确设置以下变量:
%
% X_grad - num_movies x num_features矩阵，包含w.r.t对x的每个元素的偏导数
% Theta_grad - num_users x num_features矩阵，包含w.r.t对的每个元素的偏导数


% 若第i个电影被第j个用户评分，则计算他们的(X * Theta' - Y).^2和，否则抛弃
J_temp = (X * Theta' - Y).^2;
J = sum(sum(J_temp(R == 1))) / 2 + lambda / 2 * sum(sum(X.^2)) + lambda / 2 * sum(sum(Theta.^2));
% 协同过滤，得到X可以计算Theta，得到Theta可以计算X，对X和Theta不断迭代计算
X_grad = ((X * Theta' - Y) .* R) * Theta + lambda .* X;
Theta_grad = ((X * Theta' - Y) .* R)' * X + lambda .* Theta;

% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
