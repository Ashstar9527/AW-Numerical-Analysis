% Function
f = @(x) cos(exp(x));
itermax = 40;

% Find root
x_exact = fzero(f, [-1, 1]);

% Bisection setting
a = -1;
b = 1;
tol = 1e-10;

% Bisection Method
[x_bisect, xiter_bi, niter_bi] = bisection_tol(f, a, b, itermax, tol);
error_bisect = x_bisect - x_exact;
disp(['1. Error of Bisection Method: ', num2str(error_bisect)]);
result = (error_bisect < tol);
disp(['     Is error of Bisection smaller than the tolerance? ', num2str(result)]);

% Newton's setting
fp = @(x) -exp(x) * sin(exp(x));
x0 = -0.2;

% Newton's Method
[x_newt,xiter_newt, niter_newt] = newton_tol(f,fp,x0,itermax, tol);
error_newt = x_newt - x_exact;
disp(['2. Error of Newtons Method: ', num2str(error_newt)]);
result = (error_newt < tol);
disp(['     Is error of Newtons smaller than the tolerance? ', num2str(result)]);

% Secant setting
x0 = 0.1;
x1 = 0.2;

% Secant Method
[x_sec,xiter,niter_sec] = secant_tol(f,x0,x1,itermax,tol);
error_sec = x_sec - x_exact;
disp(['3. Error of Secant Method: ', num2str(error_sec)]);
result = (error_sec < tol);
disp(['     Is error of Secant smaller than the tolerance? ', num2str(result)]);