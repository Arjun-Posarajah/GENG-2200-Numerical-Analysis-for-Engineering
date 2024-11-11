t=linspace(0,2*pi,8);
f=sin(t).^2;
tt=linspace(0,2*pi);
ftrue=sin(tt).^2;
f3=pchip(t,f,tt);
Et3=f3-ftrue;
subplot(1,2,1);
plot(t,f,'o',tt,f3)
title('Cubic Hermite Interpolation')
subplot(1,2,2);
plot(tt,Et3)
title('error')
