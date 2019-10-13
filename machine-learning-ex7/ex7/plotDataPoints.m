function plotDataPoints(X, idx, K)
%PLOTDATAPOINTS plots data points in X, coloring them so that those with the same
%index assignments in idx have the same color
%   PLOTDATAPOINTS(X, idx, K) plots data points in X, coloring them so that those 
%   with the same index assignments in idx have the same color

% Create palette
%���������� hsv ��ɫͼ��K+1����ɫ�ļ������汾
palette = hsv(K + 1);
colors = palette(idx, :);

% Plot the data
%scatter(x,y,sz,c) ָ��Բ��ɫ��Ҫ����ͬ����ɫ��������ԲȦ��
%�뽫 c ָ��Ϊ��ɫ���ƻ� RGB ��Ԫ����Ҫʹ�ò�ͬ����ɫ��
%�뽫 c ָ��Ϊ�������� RGB ��Ԫ����ɵ����о���
scatter(X(:,1), X(:,2), 15, colors);

end
