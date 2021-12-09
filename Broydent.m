function [time_list,k] = Broydent(x,tol,nmax)
% This function outputs a list of approximate solution for the nonlinear
% system f(x) = 0.

%   Initialization
x = x(:);   %x is a column vector
x_list = [];
%fprintf('k      ||f(x_k)||  \n')
%format long g

%Broyden
A_0 = Jcb(x);
v = fun(x);     %v=F(x^(0))

A = A_0^-1;

s = -A*v;        %s=s_1
x = x + s;      %x=x^(1)
k = 2;
disp(x);
x_list = [x_list,x];
time_sum = 0;        %initialize variable to keep track of computational time required by updates
time_list = [0];

for k = 2:nmax
    t = cputime;
    w = v;
   
    v = fun(x);
    y = v - w;
    %fprintf('%d      %e      \n', k-1, norm(x))
    z = -A * y;
    
    p =  -(s.') * z;
    
    u = (s.') * A;
    u = u.';
    
    A = A + (1/p)*(s+z)*(u.');
    
    s = -A*v;
    
    x = x + s;
    
    if norm(s) < tol
        disp(x);
        x_list = [x_list,x];
        time_sum = time_sum + cputime - t;
        time_list = [time_list,time_sum];   %record time required for updates
        return 
    end
    disp(x);
    x_list = [x_list,x];
    time_sum = time_sum + cputime - t;
    time_list = [time_list,time_sum];   %record time required for updates
end
end