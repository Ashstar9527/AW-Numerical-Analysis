%% Problem 4_d
A = 2*rand(1000)-1;
A = A/norm(A);
xtrue = 2*rand(1000,1)-1;
xtrue = xtrue/norm(xtrue);
b = A*xtrue;

[L, U, z] = lu_nopivot(A, b);
y = forwardsub(L, b);
x = backsub(U, y);
error = norm(x - A\b);

disp("Error")
disp(error);