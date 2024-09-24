% Function
f = @(x) cos(exp(x));
itermax = 1000;

% Find root
x_exact = fzero(f, [-1, 1]);

% Bisection: setting
a = -1;
b = 1;

% Bisection: Define the tolerances to test, from 10^-1 to 10^-10
tolerances = 10.^-(1:10);

% Bisection: Initialize vectors to store results
niter_bisect = zeros(length(tolerances),1);

% Bisection: Loop over each tolerance
for i = 1:length(tolerances)
    tol = tolerances(i);
    
    % Run bisection method
    [x_bisect, xiter, niter_bisect(i)] = bisection_tol(f, a, b, itermax, tol);
end

% Newton's: setting
fp = @(x) -exp(x) * sin(exp(x));
x0 = 0;
niter_newt = zeros(length(tolerances),1);

% Newton's: Loop
for i = 1:length(tolerances)
    tol = tolerances(i);
    [x_newt, xiter, niter_newt(i)] = newton_tol(f, fp, x0, itermax, tol);
end

% Secant: setting
x0 = 0;
x1 = 1;
niter_sec = zeros(length(tolerances),1);

% Secant: Loop
for i = 1:length(tolerances)
    tol = tolerances(i);
    [x_sec, xiter, niter_sec(i)] = secant_tol(f, x0, x1, itermax, tol);
end

% Plot
figure;
semilogx(tolerances, niter_bisect, '-o', 'LineWidth', 2);
hold on;
semilogx(tolerances, niter_newt, '-o', 'LineWidth', 2);
hold on;
semilogx(tolerances, niter_sec, '-o', 'LineWidth', 2);
hold off;

% Set axis labels and title
xlabel('Error Tolerance (log scale)');
ylabel('Number of Iterations');
title('Error Tolerance vs Number of Iterations');

% Set the grid for better visibility
grid on;

% Add a legend
legend('Bisection Method', 'Newtons Method', 'Secant Method');