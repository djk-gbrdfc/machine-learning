function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

yNum = zeros(m, num_labels);        % 5000 * 10
for i = 1:m
    yNum(i, y(i)) = 1;              %建立一个类似one-hot的表，在数字真实值处标1，其它标0
end

a1 = [ones(m, 1) X];

z1 = sigmoid(a1 * Theta1');                             % 5000 * 25
a2 = [ones(m, 1) z1];                                   % 5000 * 26
z2 = sigmoid(a2 * Theta2');                             % 5000 * 10
J = sum(diag(-yNum' * log(z2) - (1.-yNum)' * log(1.-z2))) / m;
costregularization =  lambda / (2 * m) * (sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:, 2:end).^2)));
J = J + costregularization;
%diag函数的作用是取矩阵对角线的值相加，因为多分类中矩阵相乘会出现多余的值，使用diag函数可以去除这些值
%反向传播
theta1 = [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
theta2 = [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];
%输出层与隐藏层的误差计算公式不同。输出层误差为（预测值-标签），
%隐藏层误差为上一层误差 * 与下一层权重 .* sigmoid的偏导数（sigmoidGradient中的值应为未进行sigmoid时的值）
d3 = z2 - yNum;                                                    % 5000 * 10   输出层的误差
d2 = (d3 * Theta2(:, 2:end)).*sigmoidGradient(a1 * Theta1');       % 5000 * 25   隐藏层的误差

D2 = d3' * a2;                                          %计算的是Theta2的梯度下降的反馈误差
regularization2 = lambda / m * theta2;
D1 = d2' * a1;                                          %计算的是Theta1的梯度下降的反馈误差
regularization1 = lambda / m * theta1;
Theta1_grad = D1 / m + regularization1;
Theta2_grad = D2 / m + regularization2;

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
