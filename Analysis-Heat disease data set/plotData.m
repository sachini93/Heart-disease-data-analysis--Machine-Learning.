function plotData(X, y)
%this function plots the data points X and y into a new figure 

% Create New Figure
figure; hold on;

positive = find(y == 1);
negative = find(y == 0);

plot(X(positive, 1), X(positive, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(negative, 1), X(negative, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);


hold off;

end