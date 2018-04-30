%%----------Cleveland Heart disease data analysis----------
% this file contains the implementaion for logistic regression classification 
% of Cleveland heart disease data.
% the blood cholestrol level(chol) and the resting blood preasure(tresbps) have been conciders
% as attributes for the classification.

%%load initial packages
pkg load statistics


%% Initialization
clear ; close all; clc

%% ============ Load data ============
data=dlmread("clevlandedited.txt","\t",0,0);

X = data(:, [4, 5]); y = data(:, 14);


%% ============ Plotting data============

%plot Cholestrol data distribution.
fprintf('\n----ploting Cholestrol data distribution..\n');
figure; hold on;
histfit(X(:,1));
xlabel("Chol");
ylabel("count");
hold off;
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%plot tresbp data distribution.
fprintf('\n----ploting trebp data distribution..\n');
figure; hold on;
histfit(X(:,2));
xlabel("tresbp");
ylabel("count");
hold off;
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%plot chol and trestbps with num(heart disease status)
fprintf('\n----ploting scatter plot of X and Y matixes\n');
plotData(X, y);

% Labels and Legend
hold on;
xlabel('trestbps')
ylabel('chol')

legend('disease ', 'no disease ')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% ============ Compute Cost and Gradient ============

%  seting up data matix and add ones to intercept term
[m, n] = size(X);
X = [ones(m, 1) X];

% set initial Theta
theta_i = zeros(n + 1, 1);

% Calculate the initial cost and gradient
[cost, gradient] = costFunction(theta_i, X, y);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', gradient);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% =============use fminunc  built in function to find optimized theta values============

%  Set options for fminunc function
opt = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc 
%  get optimal theta values and the cost
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)),theta_i, opt);

% display theta and cost by fminunc function
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

% Plot Desission Boundary
plotDecisionBoundary(theta, X, y);
hold on;
% Labels and Legend
xlabel('Dicease status')
ylabel('trestbps')

legend('disease ', 'no disease ')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ============== Predict and dispaly Accuracies ==============

probability = sigmoid([1 145 286] * theta);
fprintf(['For a student with scores 145 mm Hg and 286 mg/dl,  predicted status ' ...
         'probability of %f\n\n'], probability);

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

