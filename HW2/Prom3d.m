%% Problem 3_d
% Define function
f = @(x) - 4 + 3*x - 2 * x.^2 + x.^3;
x0 = 1;
eps = 2.22 * (10.^-16);

% Define h
a = linspace(-16,0,100);
hiter = 10.^a;

% Calculate error
% Setting space
res = zeros(length(a));
error = zeros(length(a));
y1 = zeros(length(a));
y2 = zeros(length(a));

for i = 1:length(a)
    res(i) = (f(x0+hiter(i)) - f(x0)) / hiter(i);
    error(i) = abs(res(i) - 2);
    y1(i) = hiter(i);
    y2(i) = 2 * eps * 2/ hiter(i);
end

% Plot
figure(1);
h1 = loglog(hiter, error, '-');hold on;
h2 = loglog(hiter, y1, 'r--');hold on;
h3 = loglog(hiter, y2, 'b--'); hold off;

% Labeling
legend([h1(1) h2(1) h3(1)],{'Error', 'y = |f"(1)|h/2', 'y = 2\epsilon|f(1)|/h'});
title("Error over h");