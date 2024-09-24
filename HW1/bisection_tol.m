% Solve f(x)=0 for scalar x by bisection method
%
% Inputs
% f         Function handle for f
% [a,b]     Initial guess interval
% itermax   Number of iterations
% tol       Error tolerance
%
% Output
% x         Approximate root of f(x)=0
% xiter     Vector containing all iterates of bisection method
% niter     Number of iterations
%
% Note: In bisection method, [a,b] must contain a root, and the sign of
% f(a) must differ from the sign of f(b). Otherwise, this function will
% return an empty result.

function [x,xiter, niter] = bisection_tol(f,a,b,itermax,tol)

fa = f(a);
fb = f(b);

if (sign(fa)==sign(fb))
    warning('sign(f(a)) must be different from sign(f(b)); returned empty result');
    x = [];
    xiter = [];
    return;
end

xiter = zeros(itermax+1,1);   % Store each iterate of bisection method
niter = itermax; % By default, assume reaching the maximum

c_pre = [];

for i=1:itermax

    c = (a+b)/2;    % Compute midpoint
    xiter(i) = c;   % Store this iterate
    fc = f(c);      % Evaluate f at midpoint

    if abs(xiter(i) - c_pre) <= tol
            x = c;  % The solution is within the tolerance
            xiter(i+1:end) = [];  % Remove unused entries from xiter
            niter = i;  % Update the number of iterations taken
            return;
    end

    % Update interval
    if (sign(fa)==sign(fc))
        c_pre = c;
        a = c;
        fa = fc;
    elseif (sign(fb)==sign(fc))
        c_pre = c;
        b = c;
        fb = fc;
    else % Since sign(f(a))/=sign(f(b)) always, f(c)=0 in this case
        x = c;
        xiter(i+1:end) = [];
        return;
    end
end

x = (a+b)/2; % Final result is current midpoint
xiter(niter+1) = x;

end