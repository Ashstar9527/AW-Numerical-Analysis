%% 1a: Gaussian elimination with partial pivoting
%
% Inputs
% A     n x n coefficient matrix
% b     right-hand side vector
%
% Outputs
% x     solution vector

function x = gausselim(A,b)
    n = length(b);
    
    % Gaussian Elimination with Partial Pivoting
    for j = 1:n-1
        % Partial Pivoting
        [~, pivot] = max(abs(A(j:n,j)));   % Find row with largest pivot
        pivot = pivot + j - 1;             % Adjust index
        
        if A(pivot, j) == 0 % Termination for special case
            error('Matrix is singular. No unique solution exists.');
        end
        
        if pivot ~= j
            % Swap rows in A
            A([j pivot], :) = A([pivot j], :);
            % Swap corresponding values in b
            b([j pivot]) = b([pivot j]);
        end
        
        % Elimination
        for i = j+1:n
            c = A(i,j) / A(j,j);
            A(i,j:n) = A(i,j:n) - c * A(j,j:n);
            b(i) = b(i) - c * b(j);
        end
    end
    
    % Check singular matrix after elimination
    if A(n,n) == 0
        error('Matrix is singular. No unique solution exists.');
    end
    
    % Backward substraction
    U = triu(A); % Upper triangular matrix after elimination
    x = backsub(U, b);
    
end
