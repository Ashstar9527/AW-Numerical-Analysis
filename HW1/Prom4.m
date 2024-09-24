%% Problem 4 (a)
% Setting up
f = @(x) x.^5 - 3 * x .^ 2 + 1; 
fp = @(x) 5*x.^4 - 6*x; 
a = -2;
b = 2;
d = 0.25; 
itermax = 50;
tol = 0.1;

num_pre = 0;
intervals = a:d:b;
x_sol = zeros(length(intervals) - 1, 1); 

% Find estimated root in each interval length of 0.25 with bisection method
for i = 2:length(intervals)
    x = bisection_tol(f,intervals(i-1),intervals(i),itermax,tol);
    if(~isempty(x))
        x_sol(i-1) = x;
        num_pre = num_pre + 1;
    end
end

% Setting up Newton's
x_pre = zeros(num_pre,1);
num_sol = 1;
sol = 0;

% Run Newton's Method
for i = 1:length(x_sol)
    if(x_sol(i) ~= 0)
        sol = newton_tol(f,fp,x_sol(i),30, 10^-12);
        x_pre(num_sol) = sol;
        num_sol = num_sol + 1;
    end
end
disp(x_pre)

%% Problem 4b
% Setting
a1 = -0.75;
b1 = -0.5;
a2 = -1;
b2 = -0.5;

% Run the functions
[x1, niter1, xiter1] = bisection_tol(f,a1,b1,itermax,tol);
[x2, niter2, xiter2] = newton_tol(f,fp,x1,itermax, 10^-12);
[x3, niter3, xiter3] = bisection_tol(f,a2,b2,100,10^-12);
disp(niter3)

