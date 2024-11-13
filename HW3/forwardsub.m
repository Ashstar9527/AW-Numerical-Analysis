%% Forward Substitution
%
% Inputs
% L         A lower triangular matrix
% b         Right-hand side vector
%
% Output
% x         Solution vector

function x = forwardsub(L, b)
    n = length(b);     
    x = zeros(n, 1);    % Initialize solution vector x with zeros
    
    for i = 1:n
        x(i) = (b(i) - L(i, 1:i-1) * x(1:i-1)) / L(i,i);
    end
end
