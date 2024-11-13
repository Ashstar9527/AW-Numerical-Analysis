function [x, errors] = mycg(A, b, x0, tol, max_iter)
    % mycg Conjugate Gradient method for solving Ax = b
    %
    % Inputs:
    %   A           Symmetric positive-definite matrix (n x n)
    %   b           Right-hand side vector (n x 1)
    %   x0          Initial guess for the solution (n x 1)
    %   tol         Error tolerance
    %   max_iter    Maximum number of iterations
    %
    % Outputs:
    %   x           Approximate solution vector (n x 1)
    %   errors      Vector of error estimates at each iteration

    % Variables Setup
    x = x0;
    r = b - A * x;           % Initial residual
    p = r;
    errors = zeros(max_iter, 1);  
    r_norm = r' * r;

    for k = 1:max_iter
        Ap = A * p;
        
        % Update x
        alpha = r_norm / (p' * Ap);
        x = x + alpha * p;

        % Update residual
        r = r - alpha * Ap;
        new_r_norm = r' * r;

        % Compute error estimate
        errors(k) = sqrt(new_r_norm);
        
        % Check tolerance
        if errors(k) < tol
            errors = errors(1:k); 
            return;
        end

        % Update direction
        beta = new_r_norm / r_norm;
        p = r + beta * p;
        
        % Update residual norm
        r_norm = new_r_norm;
    end
end