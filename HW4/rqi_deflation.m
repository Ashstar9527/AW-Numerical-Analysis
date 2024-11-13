function [evals, evecs] = rqi_deflation(A, tol, max_iter)
    % rqi_deflation implementing Rayleigh quotient iteration 
    % with deflation to compute all the eigenvalues and eigenvectors of
    % a symmetric matrix. 
    % 
    % Inputs:
    %   A           Symmetric matrix n x n
    %   tol         Error tolerance
    %   max_iter    Maximum number of iterations per eigenvalue
    %
    % Outputs:
    %   evals       Vector of computed eigenvalues
    %   evecs       Matrix of computed eigenvectors

    % Turn off warning
    warning('off', 'MATLAB:nearlySingularMatrix');

    n = size(A, 1);
    evals = zeros(n, 1);
    evecs = zeros(n, n);
    
    for k = 1:n
        % Initial guess
        v = randn(n, 1); 
        v = v / norm(v); 
        
        lambda = v' * A * v; % Initial Rayleigh quotient
        iter = 0;
        
        while iter < max_iter
            iter = iter + 1;
            
            w = (A - lambda * eye(n)) \ v;
            v = w / norm(w); 
            
            % Update the Rayleigh quotient
            lambda_new = v' * A * v;
            
            % Check tolerance
            if abs(lambda_new - lambda) < tol
                break;
            end
            lambda = lambda_new;
        end
        
        % Store
        evals(k) = lambda;
        evecs(:, k) = v;
        
        % Deflate A
        A = A - lambda * (v * v');
    end
    % Turn warning back on
    warning('on', 'MATLAB:nearlySingularMatrix');
end