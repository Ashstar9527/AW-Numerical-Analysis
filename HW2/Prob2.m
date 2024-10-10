%% Problem 2_c
function [x1,x2,niter,error] = r_newton(f1,f2,df11,df12,df21,df22,x1,x2);
% Input:
% f1, f2: original functions
% df11, df12, df21, df22: partial derivative that form jacobian matrix 
% x1, x2: initial guess
% Output:
% x1, x2: final solutions
% niter: number of iteration
% error: residual error

    niter = 0;
    % Iterate until Euclidean norm smaller than tolerance
    while abs((dot(f1(x1,x2), f1(x1,x2))) + (dot(f2(x1,x2), f2(x1,x2)))) >= 10^-20
        fk = [f1(x1,x2); f2(x1,x2)];
        Jac = [df11(x1,x2), df12(x1,x2); df21(x1,x2), df22(x1,x2)];
        delta = Jac\fk;
    
        x1 = x1 - delta(1);
        x2 = x2 - delta(2);

        niter = niter + 1;

        error = sqrt(f1(x1,x2)^2 + f2(x1,x2).^2);
    end
end

%% Use the function
% Setting up
f1 = @(x1,x2) 5*x1 + x1.* x2.^2 + cos(3*x2).^2 - 1;
f2 = @(x1,x2) exp(2*x1-x2) + 4 * sin(x2) - 2;

df11 = @(x1,x2) 5 + x2.^2;
df12 = @(x1,x2) 2*x1*x2 + 2 * cos(3*x2) * (-sin(3*x2))*3;
df21 = @(x1,x2) exp(-x2) * 2 * exp(x1);
df22 = @(x1,x2) -exp(2*x1-x2) + 4 * cos(x2);

x1 = 0.103;
x2 = 0.241;

% Launch the function
[x1,x2,niter,error] = r_newton(f1,f2,df11,df12,df21,df22,x1,x2);

% Print results
fprintf("Solution: (%.10f,%.10f)\n", x1, x2);
fprintf("Num of iteration: %d\n", niter);
fprintf("Residual error: %.12f\n", error);






