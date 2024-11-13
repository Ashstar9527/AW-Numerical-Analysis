%% Prob 3-b
plotsettings;

% Generate 500 data
ndata = 500;
f = @(x) cos(sin(x)) .^ 3;
xdata = 2*pi*rand(ndata,1);
fdata = f(xdata) + 0.05*randn(ndata,1);

% a0-a9
% Define A
A = zeros(500, 10); % Size A for 500 data points
for i = 1:500
    for j = 1:10
        A(i, j) = cos((j-1) * xdata(i));  
    end
end


% Do QR decomposition
[Q, R] = qr(A);

% Coefficient
coeff = R \ (Q'*fdata);

% Evaluate f hat(x) on the grid of 1000
xiter = linspace(0, 2*pi, 1000)';

fx = f(xiter);
A = zeros(1000, 10); % New A
for i = 1:1000      
    for j = 1:10
        A(i, j) = cos(xiter(i) * (j-1));
    end
end

fxhat = A * coeff;

% Plot the graph
figure(1);
plot(xiter, fx, 'r', xiter, fxhat, 'g-', xdata, fdata, 'o');
legend("$f(x)$","$\hat{f}(x)$","noisy data");
title('Prom 3-b');

% Max error
max_err = max(abs(fxhat-fx));
disp("max error:");
disp(max_err);
