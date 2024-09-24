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

% Newton's: setting
fp = @(x) -exp(x) * sin(exp(x));
x0 = 0;
[x_newt, xiter_newt] = newton(f, fp, x0, itermax);
errors_newt = abs(xiter_newt - x_exact);

% Secant: setting
x0 = 0;
x1 = 1;

% Secant: Loop
[x_sec, xiter_sec] = secant(f, x0, x1, itermax);
errors_sec = abs(xiter_sec- x_exact);

% Adding small constants to avoid log(0)
c = eps; 
log_bisect = log(max(errors_bisect, c)); 
log_newt = log(max(errors_newt, c)); 
log_sec = log(max(errors_sec, c)); 

% Figure
figure;
scatter(log_bisect(1:end-1), log_bisect(2:end));
hold on;
scatter(log_newt(1:end-1), log_newt(2:end));
hold on;
scatter(log_sec(1:end-1), log_sec(2:end));

% Add the lines y = px
x_vals = linspace(min([log_bisect; log_newt; log_sec]), ...
    max([log_bisect; log_newt; log_sec]), 100);

plot(x_vals, x_vals, '.--');                    % Bisection
plot(x_vals, 2*x_vals, '.--');                  % Newton
plot(x_vals, ((1+sqrt(5))/2)*x_vals, '.--');    % Secant


% Customize plot
xlabel('log(e_{k-1})');
ylabel('log(e_k)');
legend('Newton', 'Bisection', 'Secant', 'p = 1', 'p = 2', 'p = (1+sqrt(5))/2', 'Location', 'best');
title('Convergence Order Visualization');
grid on;
