function [x_list,k] = newton(x,tol,nmax)
%   This function returns in x a column vector x_k such that
%       ||x_k - x_{k-1}|| < tol 
%and in k the number of iterations (Jacobian evaluations) required. 
%   On entry, x contains an initial guess.
%   If k equals nmax the no convergence has been reached.
%   

%   Initialization
x = x(:);   %x is a column vector
fprintf('k      ||f(x_k)||  \n')
format long g

x_list = [x];        %initialize list to keep track of iterates

%   Newton
for k=1:nmax
    fx = fun(x);
    Jx = Jcb(x);
    fprintf('%d      %e      \n', k-1, norm(fx))
    p = -Jx \ fx; % solving the linear system
    x = x + p;
    x_list = [x_list,x];  %record iterate
    if norm(p) < tol
        fx = fun(x);
        fprintf('%d      %e      \n', k, norm(fx))
        return
    end
end
k=nmax;
    