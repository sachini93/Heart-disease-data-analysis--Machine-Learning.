function plotDecisionBoundary(theta, X, y)
%this function plots data points X,Y into a new figure with the dession boudary.
% the input param, X assumed either Mx1 matrix or MxN matrix

% Plot Data
plotData(X(:,1:2), y);
hold on

if size(X, 2) <= 3
    % choose two endpoints to plot the line
    x_mark = [min(X(:,1))-2,  max(X(:,2))+2];

    % Calculate the decision boundary line
    y_mark = (-1./theta(2)).*(theta(1).*x_mark + theta(1));

    % Plot, and adjust axes 
    plot(y_mark, x_mark)
    axis([80, 200, 80, 200])
    
    % Legend 
    legend('dicease', 'No dicease', 'Decision Boundary')
    
else
    % define grid range
    u = linspace(-1, 1.5, 30);
    v = linspace(-1, 1.5, 30);

    z = zeros(length(u), length(v));
    % Evaluate z = theta*x over the grid
    for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) = mapFeature(u(i), v(j)).*theta;
        end
    end
    z = z';

    % Plot z = 0
    contour(u, v, z, [0, 0], 'LineWidth', 2)
end
hold off

end
