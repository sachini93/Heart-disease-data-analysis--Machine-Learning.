function p = predict(theta, X)
%% this function predic the lables 0 or 1 for the output result using theat 
%  and X values

%  if sigmoid(theta'*x) >= 0.5, predict 1) etc..

%m=number of trainig example
m = size(X, 1); 

p = zeros(m, 1);

result = sigmoid(X * theta); 
p = round(result); 
 
end