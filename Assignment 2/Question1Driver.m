 depth = @(y) 1-20^2/(9.81*(3*y+y^2/2)^3)*(3+y);
    x_l = 0.5;
    x_u = 2.5;
   
    %graphical method
    syms y;
    ezplot(depth(y));
    hold on;
    ezplot('0');

    % bisection method
    bisection = bisec(depth,x_l,x_u,10,.01);
    
  
    % false-position method
    falsePosition = falsepos(depth,x_l,x_u,10,.01);