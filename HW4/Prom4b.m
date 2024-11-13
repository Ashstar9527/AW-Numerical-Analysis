function prob4()
    % prob4 Tests the Conjugate Gradient method on two different matrices
    
    % Parameters
    n = 1000;
    tol = 1e-12;
    max_iter = 1000;

    % Generate two random SPD matrices
    A1 = generate_spd_matrix(n, 1, 4);
    A2 = generate_spd_matrix(n, 1, 100);

    % Random right-hand side
    b = randn(n, 1);
    b = b / norm(b);  % Normalize to ||b||2 = 1
    x0 = zeros(n, 1); % Initial guess

    % Solve with Conjugate Gradient
    [~, errors1] = mycg(A1, b, x0, tol, max_iter);
    [~, errors2] = mycg(A2, b, x0, tol, max_iter);

    % Plot errors for each case
    figure;
    semilogy(1:length(errors1), errors1, '-o');
    title('Conjugate Gradient Errors for Matrix A1 (Eigenvalues in [1, 4])');
    xlabel('Iteration');
    ylabel('Error ||e_k||_A');

    figure;
    semilogy(1:length(errors2), errors2, '-o');
    title('Conjugate Gradient Errors for Matrix A2 (Eigenvalues in [1, 100])');
    xlabel('Iteration');
    ylabel('Error ||e_k||_A');
end

% Helper function to generate random SPD matrix with eigenvalues in [a, b]
function A = generate_spd_matrix(n, a, b)
    % Generate diagonal matrix with eigenvalues in [a, b]
    lambda = a + (b - a) * rand(n, 1);
    D = diag(lambda);

    % Generate random orthogonal matrix
    [Q, ~] = qr(randn(n, n));

    % Construct SPD matrix A = Q * D * Q'
    A = Q * D * Q';
end