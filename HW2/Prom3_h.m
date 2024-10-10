%% Problem 3_h
% Define function
f = @(x) -4 + 3*x - 2 * x^2 + x^3;
% Differential matrix
D = [0 1 0 0;
    0 0 2 0;
    0 0 0 3];% 
% Coefficient matrix
v = [-4; 
    3; 
    -2; 
    1]; 
e = ones(3,1);

% Compute f'(1)
d = (e.' * D).';   % d = e^T * D
f1 =  d.' * v;    % f'(1) = d^T * v
fprintf("Result without noise:")
disp(f1);

% With noise
v = v+ eps*rand(4,1);
d = (e.' * D).';   % d = e^T * D
f1w =  d.' * v;    % f'(1) = d^T * v;
fprintf("Result with noise: %.16f", f1w);