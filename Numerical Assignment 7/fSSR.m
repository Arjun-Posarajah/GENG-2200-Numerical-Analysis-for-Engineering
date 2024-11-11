function f=fSSR(a,tm,km)
kp=((a(1)./tm)+(a(2).*log10(tm))+(a(3).*tm)+a(4));
f=sum((km-kp).^2);

