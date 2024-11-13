%% Problem 4_e
A = 2*rand(1000)-1;
A = A/norm(A);
xtrue = 2*rand(1000,1)-1;
xtrue = xtrue/norm(xtrue);
b = A*xtrue;

x = gausselim(A,b);

error = norm(x - A\b);

disp("Partial Pivoting Error")
disp(error);

[L, U, z] = lu_nopivot(A, b);
y = forwardsub(L, b);
x = backsub(U, y);
error = norm(x - A\b);

disp("LU Error")
disp(error);