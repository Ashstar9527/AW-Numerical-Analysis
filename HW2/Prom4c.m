%% Problem 4_c
A = [2, -1, 0;
    -1, 2, -1;
    0, -1, 2];
b = [1; 
    0; 
    1];

[L, U, z] = lu_nopivot(A,b);
y = forwardsub(L, b);
x = backsub(U, y);
error = norm(x-[1;1;1]);

disp("x");
disp(x);
disp("Error");
disp(error);
