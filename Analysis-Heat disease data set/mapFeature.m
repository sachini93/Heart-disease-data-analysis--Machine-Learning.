function out = mapFeature(X1, X2)
% this function maps polynomial features in X1,X2

deg = 10;
out = ones(size(X1(:,1)));
for i = 1:deg
    for j = 0:i
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end

end