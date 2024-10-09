%% Problem 4_d
A = [10.^-20, 1;
     1, 1];
b = [1; 
     2];

[L, U, z] = lu_nopivot(A, b);
y = forwardsub(L, b);
x = backsub(U, y);
error = norm(x - [1; 1]);

% Display solution
disp("x");
disp(x);
disp("Error");
disp(error); 