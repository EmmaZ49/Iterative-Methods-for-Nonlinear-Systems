function f = fun(x)
x1 = x(1);
x2 = x(2);
x3 = x(3);
f = zeros(3,1);
f(1) = 3*x1 - cos(x2*x3)-1/2;
f(2) = x1^2-81*(x2+0.1)^2+sin(x3)+1.06;
f(3) = exp(-x1*x2)+20*x3+(10*pi-3)/3;
end
