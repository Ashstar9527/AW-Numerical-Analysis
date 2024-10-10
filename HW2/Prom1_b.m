% Define the functions
f = @(x) exp(x) - x.^2 - 6*x - 9;  
g = @(x) 2 * log(x+3);  

% Define the range for x and y
xiter = -3:0.01:8; 
gxiter = g(xiter); 

% Plot
figure(1)
plot(xiter, gxiter, 'b-', xiter, xiter, 'r-', 'LineWidth', 2); 
title("Fix points of g(x)");
xlabel('x');
ylabel('y');
legend('g(x) = 2log(x+3)', 'y = x');  
grid on;
