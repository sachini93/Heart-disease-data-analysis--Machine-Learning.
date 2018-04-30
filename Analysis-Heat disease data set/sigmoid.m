function g = sigmoid(z)
%This function computes the sigmoid of z
 
g = zeros(size(z));

% denom=denominator
denom = 1 + exp(-1 * z); 
g = 1 ./ denom; 


end