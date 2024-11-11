function ANS = falsepos( f, x_l, x_u, iter, error )
%FALSEPOS false position method
 disp('The False Position data values are:');    
for i = 1:iter
        x_r(i) = x_u - (f(x_u)*(x_l - x_u))/(f(x_l) - f(x_u));
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
        fprintf('%1.0f\t %8.5f\t %8.5f\t %8.5f\n',i, x_l, x_u, x_r);
    end
    ANS = x_r(end)
end