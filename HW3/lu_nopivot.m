%% LU factorization without pivoting
%
% Inputs
% A         Matrix of linear system
% b         Right-hand side of linear system
%
% Output
% L         Lower triangular matrix obtained by elimination on A
% U         Upper triangular matrix obtained by elimination on A
% y         Right-hand side vector transformed by elimination on A, such that
%           Ux = y
%
% Warning: Since this function does not use pivoting, it is likely to fail to
% produce an accurate solution in many cases.

function [L,U,y] = lu_nopivot(A,b)

n = length(b);
L = eye(length(b));

% Elimination
for j=1:n-1
    for i=j+1:n
        % U part
        c = A(i,j)/A(j,j);
        A(i,j:n) = A(i,j:n) - c*A(j,j:n); 
        b(i) = b(i) - c*b(j); 

        % L part
        L(i,j) = c; % Return modified L
    end
end

U = triu(A);   % Upper triangular part of A
y = b;         % Transformed right-hand side

end

