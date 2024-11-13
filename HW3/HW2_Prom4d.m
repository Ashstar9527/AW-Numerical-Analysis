%% HW2 4_d
A = [10.^-20, 1;
     1, 1];
b = [1; 
     2];

x = gausselim(A,b);
error = norm(x - A\b);

% Display solution
disp("x");
disp(x);
disp("Error");
disp(error); 