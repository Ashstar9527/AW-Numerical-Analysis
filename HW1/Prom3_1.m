% Function
f = @(x) cos(exp(x));
itermax = 50;

% Find root
x_exact = fzero(f, [-1, 1]);

% Bisection: setting
a = -1;
b = 1;

% Bisection: Find root and calculate error
[x_bisect, xiter_bisect] = bisection(f, a, b, itermax);
errors_bisect = abs(xiter_bisect - x_exact);
errors_bisect = [errors_bisect; zeros(51 - length(errors_bisect), 1)];

% Newton's: setting
fp = @(x) -exp(x) * sin(exp(x));
x0 = 0;
[x_newt, xiter_newt] = newton(f, fp, x0, itermax);
errors_newt = abs(xiter_newt - x_exact);
errors_newt = [errors_newt; zeros(51 - length(errors_newt), 1)];

% Secant: setting
x0 = 0;
x1 = 1;

% Secant: Loop
[x_sec, xiter_sec] = secant(f, x0, x1, itermax);
errors_sec = abs(xiter_sec- x_exact);
errors_sec = [errors_sec; zeros(51 - length(errors_sec), 1)];

% Figure
figure;
semilogy(1:itermax+1, errors_bisect, 'o-','LineWidth', 1);
hold on;
semilogy(1:itermax+1, errors_newt, 'o-', 'LineWidth', 1);
hold on;
semilogy(1:itermax+1, errors_sec, 'o-', 'LineWidth', 1);
hold off

% Add labels, title, and legend
xlabel('Iteration number k');
ylabel('Error');
title('Error vs Iterations');
legend('Bisection Method', 'Newtons Method', 'Secant Method');

grid on;


