% Problem 3b: Approximate Electric Potential u(x)

% Variables
n = 100;                     % Number of internal points
h = 1 / (n + 1);             % Step size
x = linspace(0, 1, n + 2);   % Grid points (including boundaries)
mu = 0.5;                    % Mean of Gaussian
sigma = 0.05;                % Standard deviation of Gaussian

% Gaussian charge density
q = (1 / (sigma * sqrt(2 * pi))) * exp(-(x - mu).^2 / (2 * sigma^2));
q = q(2:end-1); % Remove boundary values

e = ones(n, 1);
A = spdiags([e -2*e e], -1:1, n, n) / h^2;
u = A \ q';

% Add boundary conditions
u = [0; u; 0]; % u(0) = u(1) = 0

% Plotting
figure;
plot(x, u, 'LineWidth', 1.0);
xlabel('x');
ylabel('Electric Potential u(x)');
title('Electric Potential due to Gaussian Charge Density');