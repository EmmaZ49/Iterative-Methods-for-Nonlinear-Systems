function [x_list,k] = gaussnewton(x,tol,nmax)

%Initialization
x = x(:);
format long g

x_list = [x];

for k = 1:nmax
     Fx = fun(x);
     Jx = Jcb(x);
     r = 0-Fx;
     JT = Jx';
     JZ = -JT*Jx;
     p = JZ\JT;
     x = x - p*r;
     x_list = [x_list,x];  %record iterate
    if norm(p) < tol
        fx = fun(x);
        fprintf('%d      %e      \n', k, norm(fx))
        return
    end
end

