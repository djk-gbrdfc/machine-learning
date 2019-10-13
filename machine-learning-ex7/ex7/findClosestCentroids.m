function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

for i = 1:size(X, 1)
    %pdist函数是计算一个矩阵中每两行之间的距离，
    %pdist2函数是计算两个矩阵中任意两个元素之间的距离。
    %pdist2例：X为a*b矩阵，Y为c*b矩阵，矩阵的每一行代表一个元素，
    %返回一个a*c矩阵，代表X，Y任意两个元素之间的距离。
    distance = pdist2(centroids, X(i, :));
    [row,idx(i, 1)] = min(distance);
end

% =============================================================

end

