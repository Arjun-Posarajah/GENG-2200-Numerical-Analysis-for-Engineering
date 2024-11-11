T=[0 5 10 20 30 40];
u=[1.787 1.519 1.307 1.002 0.7975 0.6529];

p=polyfit(T,u,2)


plot(T,u,'-b')
hold on
plot(T,polyval(p,T),'-r')


