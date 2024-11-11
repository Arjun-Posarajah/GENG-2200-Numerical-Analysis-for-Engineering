t= 0:0.01:2;
ft=@(t) 9.*exp(-t).*sin(2*pi.*t)-3.5;
y=f(t);
plot(t,y),grid
xlabel ('Time in Seconds');
ylabel ('Current in Amperes');
title('Current vs Time plot');

r1=fzero(ft,[0 0.2]);
disp(r1)
r2=fzero(ft, [0.2 0.8]);
disp(r2)