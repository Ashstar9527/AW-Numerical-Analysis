%% Prob 1-d

% Set up the matrix A
n = 100; % Size of matrix
A = tril(-ones(n)) + 2*eye(n); 
A(:,end) = 1;
A(:,end) = A(:,end) + 1e-15*randn(n,1);

% Find solution x
xtrue = randn(n, 1);
b = A * xtrue;
x = gausselim(A, b);

% Error calculation
rel_err = norm(x-xtrue)/norm(xtrue);    % Relative error
cond_num = cond(A);                     % Conditional numbers
bound_err = cond_num * eps;             % Bound error
res_err = norm(A*x-b) / norm(b);        % Relative residual error

% Display the calculated errors and condition number
disp('Relative Error:');
disp(rel_err);

disp('Condition Number:');
disp(cond_num);

disp('Bound Error:');
disp(bound_err);

disp('Relative Residual Error:');
disp(res_err);
