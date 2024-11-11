k=[1.164*10^-15 2.950*10^-15 6.846*10^-15 1.467*10^-14 2.29*10^-14];
t=[273.15 283.15 293.15 303.15 313.15];
f2=(10.^f);
plot(t,k,'o',t,f2)


xlabel('temperature(K)')
ylabel('Ion product of water Kw')