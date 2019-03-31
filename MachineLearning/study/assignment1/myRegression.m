clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('myData.txt');
X = data(:, 1);
y = data(:, 2);
m = length(y);

plot(X,y,'rx','MarkerSize',10);
xlabel("Day");
ylabel("All Money Spent (Euro)");
title("Money Spent");

pause;

X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);

hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

predict = [1, 144] * theta;
fprintf('Predicting: %f\n', predict);



