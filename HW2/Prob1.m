%% Problem 1_d
% Define the functions
f = @(x) exp(x) - x.^2 - 6*x - 9;  
g = @(x) 2 * log(x+3); 

% Initial guess
x0 = 3.5;
xiter = x0; % Set up initial guess
niter = 0; % Number of iterations

% Iterate
while abs(f(xiter)) >= 10^-10
    xiter = g(xiter);
    niter = niter + 1;
end

% Display xiter with at least 10 decimal places
fprintf('Solution x = %.10f\n', xiter);
fprintf('Number of iteration is %d', niter);
