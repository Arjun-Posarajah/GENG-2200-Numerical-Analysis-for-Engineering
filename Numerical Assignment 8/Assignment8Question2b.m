 t = [1 2 3.25 4.5 6 7 8 8.5 9 10];
v = [5 6 5.5 7 8.5 8 6 7 7 5];
s = polyfit(t,v,3);
q = polyint(s);
I = diff(polyval(q,[1 10]));

fprintf('I=%2.4f\n',I)