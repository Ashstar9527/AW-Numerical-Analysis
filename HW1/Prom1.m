% Define the function
f = @(x) x.^3 - 2 * x + sin(pi*x) + exp(-x.^2);

% Create a range of x values from -1 to 1
x = linspace(-1, 1, 2000);

% Evaluate the function over the range
y = f(x);

% Plot the function
figure;
plot(x, y);
xlabel('x');
ylabel('y');
title('Plot of f(x)');
grid on;

% Use fzero to find the root
root = fzero(f, [-1,1]);
x_exact = root;

% Display the root
disp(['The root is: ', num2str(root)]);

% Interval [a, b]
a = -1;
b = 1;

% Set maximum iterations
itermax = 30;

% Use the provided bisection method to find the root and all iterates
[x_bisect, xiter] = bisection(f, a, b, itermax);

% Calculate the error at each iteration: e_k = |x_k - x*|
errors = abs(xiter - x_exact);

% Plot the error on a semilogarithmic scale for all iterations
figure;
semilogy(1:itermax+1, errors, 'o-', 'DisplayName', 'Error e_k');
hold on;

% Calculate and plot the error bound E_k = (b - a) / 2^k
error_bound = (b - a) ./ (2 .^ (1:itermax+1));
semilogy(1:itermax+1, error_bound, 'x--', 'DisplayName', 'Error Bound E_k');

% Add labels, title, and legend
xlabel('Iteration number k');
ylabel('Error');
title('Error vs Iteration Number in Bisection Method');
legend; 

grid on;
hold off;
