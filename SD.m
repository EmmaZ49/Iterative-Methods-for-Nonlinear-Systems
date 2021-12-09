function[x_list,k] = SD(x,tol,nmax)
% This function outputs a list of approximate solution for the nonlinear
% system f(x) = 0.

%   Initialization
x = x(:);   %x is a column vector
x_list = [];
x_list = [x_list,x];

%SD
for k = 1:nmax
    g1 = g_func(x);
    z = grad(x);
    z0 = norm(z);
    
    if z0 == 0
        fprintf("Zero gradient");
        fprintf(x(1),x(2),x(3),g1);
        return
    end
    
    z = z/z0;
    %disp(z);
    a1 = 0;
    a3 = 1;
    %disp(x);
    %disp(x-a3*z);
    g3 = g_func(x-a3*z);
    %disp([g1,g3]);
    
    while g3 >= g1
        a3 = a3/2;
        g3 = g_func(x-a3*z);
        if a3 < tol/2
            fprintf('No likely improvement');
            disp([x(1), x(2),x(3), g1]);
            return
        end
    end
    
    a2 = a3/2;
    g2 = g_func(x-a2*z);
    
    h1 = (g2-g1)/a2;
    h2 = (g3-g2)/(a3-a2);
    h3 = (h2-h1)/a3;
    
    a0 = 0.5*(a2-h1/h3);
    g0 = g_func(x-a0*z);
    
    g_min = min(g0,g3);
    if g_min == g0
        x = x-a0*z;
        x_list = [x_list,x];
    else
        x = x-a3*z;
        x_list = [x_list,x];
    end
    g = g_min;
    
    if abs(g-g1) < tol
        disp([x(1),x(2),x(3),g]);
        return
    end
end