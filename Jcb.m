function J = Jcb(x)
  x1 = x(1);
  x2 = x(2);
  x3 = x(3);
    
  J = zeros(3,3);
  J(1,1) = 3; % df1x1
  J(1,2) = x3 * sin (x2*x3); % df1x2
  J(1,3) = x2 * sin (x2*x3); %df1x3
  J(2,1) = 2*x1; % df2x1
  J(2,2) = -162*(x2+0.1); % df2x2;
  J(2,3) = cos(x3); %df2x3
  J(3,1) = -x2*exp(x1*x2); %df3x1
  J(3,2) = -x1*exp(-x1*x2); %df3x2
  J(3,3) = 20;%df3x3
  end