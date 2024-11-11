t=linspace(0,2*pi,8);
f=sin(t).^2;
tt=linspace(0,2*pi);
ftrue=sin(tt).^2;
fp=[0 f 0];
f2=spline(t,fp,tt);
Et2=f2-ftrue;
subplot(1,2,1);
plot(t,f,'o',tt,f2)
title('clamped')
subplot(1,2,2);
plot(tt,Et2)
title('error')
