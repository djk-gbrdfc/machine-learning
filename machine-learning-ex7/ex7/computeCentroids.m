function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

%%���Լ����룩����ÿ���㵽�þ����ľ����ֵ���þ�ֵ�����µľ�����λ��
%a = 0;
%b = 0;
%c = 0;
%for i = 1:m
%    if idx(i) == 1
%        centroids(1, :) = centroids(1, :) + X(i, :);
%        a = a + 1;
%    end
%    if idx(i) == 2
%        centroids(2, :) = centroids(2, :) + X(i, :);
%        b = b + 1;
%    end
%    if idx(i) == 3
%        centroids(3, :) = centroids(3, :) + X(i, :);
%        c = c + 1;
%    end
%end
%centroids(1, :) = centroids(1, :) / a;
%centroids(2, :) = centroids(2, :) / b;
%%centroids(3, :) = centroids(3, :) / c;

%%���ϴ���
for i = 1:K
    centroids(i, :) = mean(X(find(idx == i), :));
end

% =============================================================

end

