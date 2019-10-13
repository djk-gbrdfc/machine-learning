function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal(最佳) C and 
%   sigma based on a cross-validation set.

%完成这个函数以返回最佳的C和sigma基于交叉验证集

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%     （svmPredict.m中的model系数从svmTrain.m中获得）
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%以一定的刻度列出C和sigma
C_vec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_vec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
min_error = 0;
%分别使用不同的C和sigma进行svm训练，利用训练模型对交叉验证集中的数据进行预测，
%选择错误率最低的训练模型，选取该模型训练时所用的C和sigma值
for i = 1:length(C_vec)
    for j = 1:length(sigma_vec)
        model = svmTrain(X, y,  C_vec(i), @(x1, x2) gaussianKernel(x1, x2, sigma_vec(i)));
        predictions = svmPredict(model, Xval);
        error = mean(double(predictions ~= yval));
        if min_error == 0 || error < min_error
            min_error = error;
            C = C_vec(i);
            sigma = sigma_vec(i);
        end
    end
end


% =========================================================================

end
