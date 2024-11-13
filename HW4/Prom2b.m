%% Problem 2b: Use rqi_deflation.m on matrix from Problem 1

% Define matrix size and eigenvalues
n = 100;
lambda = 1 ./ (1:n); % Eigenvalues, 1/k
Lambda = diag(lambda); % Diagonal matrix with eigenvalues

% Generate random orthogonal matrix Q and construct symmetric matrix A
[Q, ~] = qr(randn(n));
A = Q * Lambda * Q';

% Parameters
tol = 1e-12;
max_iter = 100;

% Run Rayleigh Quotient Iteration with Deflation
[eigenvalues, eigenvectors] = rqi_deflation(A, tol, max_iter);

% Sort computed and true eigenvalues for comparison
eigenvalues = sort(eigenvalues, 'descend');
true_eigenvalues = sort(lambda, 'descend');

% Compute the absolute error of each computed eigenvalue
absolute_errors = abs(eigenvalues - true_eigenvalues);

% Plot the absolute error of each eigenvalue
figure;
plot(1:n, absolute_errors, 'o-');
xlabel('Eigenvalue Index');
ylabel('Absolute Error');
title('Absolute Error of Computed Eigenvalues');
