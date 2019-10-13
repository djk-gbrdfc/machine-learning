function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

    % 通过交叉验证集确定阈值，当交叉验证集的预测值小于阈值时赋值为1。
    % 以此实现寻找当F1值最好时，阈值epsilon的大小
    % pval是多元高斯分布求出的值
    predictions = (pval < epsilon);             % 预测值小于阈值则为1，否则为0
    tp = sum((predictions == 1) & (yval == 1)); % 真阳性
    fp = sum((predictions == 1) & (yval == 0)); % 假阳性
    fn = sum((predictions == 0) & (yval == 1)); % 假阴性
    precision = tp / (tp + fp);                 % 查准率
    recall = tp / (tp + fn);                    % 召回率
    F1 = 2 * precision * recall / (precision + recall); % F1值

    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
