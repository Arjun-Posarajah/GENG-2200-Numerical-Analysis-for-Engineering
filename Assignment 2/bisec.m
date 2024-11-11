function ANS = bisec( f, x_l, x_u, iter, error )
%BISEC bisection method
 disp('The bisection data values are:');  
for i=1:1:iter
       x_r(i) = (x_l + x_u)/2;
       if ((f(x_l)*f(x_r(i))) < 0)
           x_u = x_r(i);
       elseif ((f(x_l)*f(x_r(i))) > 0)
            x_l = x_r(i);
        elseif ((f(x_l)*f(x_r(i))) == 0)
            break;
        end
        if ((i>1) && (abs((x_r(i)-x_r(i-1))/x_r(i)) * 100) < error)
            break;
        end
        
        fprintf('%1.0f\t   %8.5f\t   %8.5f\t   %8.5f\n',i, x_l, x_u, x_r);
end
    ANS = x_r(end)
     
end