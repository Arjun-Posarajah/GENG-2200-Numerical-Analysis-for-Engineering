%a
t=linspace(0,2*pi,8);
f=sin(t).^2;
tt=linspace(0,2*pi);
ftrue=sin(tt).^2;

%b
f1=spline(t,f,tt);
Et1=f1-ftrue;
subplot(1,2,1);
plot(t,f,'o',tt,f1)
title('Not-a-knot')
subplot(1,2,2);
plot(tt,Et1)
title('error')

