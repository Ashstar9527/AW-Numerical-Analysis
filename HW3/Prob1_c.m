%% Hilbert
%
% Inputs
% n         size of Hilbert matrix
%
% Outputs
% kHn       conditional number 
% b         right hand side bi
% x         solution x using gausselim
% error     error between x and true solution

function [kHn, b, x, error] = hilbert(n)
    % Find conditional num kHn
    kHn = cond(hilb(n));
    % Set up b
    b = zeros(n,1); % Size of b;
    for i=1:n
        for j = 1:n
            b(i) = 1/(i+j-1) + b(i);
        end
    end
    % Find x
    x = gausselim(hilb(n), b);
    % Compute error
    error = norm(x-ones(n,1))/norm(ones(n,1));
end

Err = zeros(14, 0);         % Errors to be plotted
Condi_num = zeros(14, 0);   % Conditional nums
Res = zeros(14, 0);         % Tesidual error

for n = 2:15
    [kHn, b, x, error] = hilbert(n);
    Err(n-1) = error;
    Condi_num(n-1) = kHn * eps;
    Res(n-1) = norm(hilb(n) * x - b)/norm(b);
end

disp(Err);

% Plotting
semilogy(2:15, Err, 2:15, Condi_num, 2:15, Res);
legend({"relative error","$\kappa(H_n)\varepsilon$","relative " + ...
    "residual error"},'Interpreter','latex');
title("Prob 1-c");





