x1= -2;
x2= -1;
x3= 1;

f=@(x) x^4+2*x^3+8*x^2+5*x;

x4 = (x2)-((0.5)*((((x2-x1)^2)*(f(x2)-f(x3))-((x2-x3)^2)*(f(x2)-f(x1)))/(((x2-x1)*(f(x2)-f(x3)))-((x2-x3)*(f(x2)-f(x1))))));

disp(x4)
disp(f(x4))