function ans= Ea(i, x_l, x_u, x_r)
for x_r > 0
Ea= (abs((x_r(i)-x_r(i-1))/x_r(i)) * 100)
fprintf('%1.0f\t     %3.5f\n', i, Ea)
end