function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal(���) C and 
%   sigma based on a cross-validation set.

%�����������Է�����ѵ�C��sigma���ڽ�����֤��

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%     ��svmPredict.m�е�modelϵ����svmTrain.m�л�ã�
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%��һ���Ŀ̶��г�C��sigma
C_vec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_vec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
min_error = 0;
%�ֱ�ʹ�ò�ͬ��C��sigma����svmѵ��������ѵ��ģ�ͶԽ�����֤���е����ݽ���Ԥ�⣬
%ѡ���������͵�ѵ��ģ�ͣ�ѡȡ��ģ��ѵ��ʱ���õ�C��sigmaֵ
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
