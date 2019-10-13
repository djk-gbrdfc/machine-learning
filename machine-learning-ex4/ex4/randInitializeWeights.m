function W = randInitializeWeights(L_in, L_out)
%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in
%incoming connections and L_out outgoing connections
%   W = RANDINITIALIZEWEIGHTS(L_in, L_out) randomly initializes the weights 
%   of a layer with L_in incoming connections and L_out outgoing 
%   connections. 
%
%   Note that W should be set to a matrix of size(L_out, 1 + L_in) as
%   the first column of W handles the "bias" terms
%

% You need to return the following variables correctly 
W = zeros(L_out, 1 + L_in);

% ====================== YOUR CODE HERE ======================
% Instructions: Initialize W randomly so that we break the symmetry while
%               training the neural network.
%
% Note: The first column of W corresponds to the parameters for the bias unit
%

epsilon_init = 0.12;                                            %sqrt(6)/sqrt(入度神经元 + 出度神经元)
W = rand(L_out, 1 + L_in) * 2 * epsilon_init - epsilon_init;    %rand函数随机生成1以内的数，在0到1之间
                                                                %通过上式运算将W的值控制在-1到1之间

% =========================================================================

end
