t=[273.15 283.15 293.15 303.15 313.15];
k=[-14.9340 -14.5301 -14.1645 -13.8335 -13.5332];
fminsearch(@fSSR, [1,1,1,1],[], t, k)

f=((23.3976./t)+(-32.2755.*log10(t))+(0.0831).*t+40.9698);

plot(t,k,'o',t,f)

