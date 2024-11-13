% Problem 3c: Eigenvalue problem for particle in a box

% Variables
n = 100;
h = 1 / (n + 1);
x = linspace(0, 1, n + 2);

% Finite difference matrix A
A = spdiags([e -2*e e], -1:1, n, n) / h^2;

% Solve the eigenvalue
[evecs, evals] = eigs(A, 3, 'smallestabs');
evals = diag(evals); 

% Sort eigenvalues and eigenvectors
[evals, idx] = sort(evals);
evecs = evecs(:, idx);

% Plot first 3 eigenfunctions
figure;
hold on;
for i = 1:3
    % Normalize eigenfunction
    u = [0; evecs(:, i); 0]; % Boundary
    plot(x, u, 'DisplayName', sprintf('u_%d(x)', i));
end
hold off;
xlabel('x');
ylabel('u(x)');
title('Eigenfunctions for Particle in a Box');
legend;

% Plotting
figure;
hold on;
for i = 1:3
    % Compute probability density
    prob_density = abs([0; evecs(:, i); 0]).^2;
    plot(x, prob_density, 'DisplayName', sprintf('|u_%d(x)|^2', i));
end
hold off;
xlabel('x');
ylabel('Probability Density');
title('Probability Densities for Particle in a Box');
legend;
