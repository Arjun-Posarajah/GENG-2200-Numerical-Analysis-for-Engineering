 t = [1 2 3.25 4.5 6 7 8 8.5 9 10];
v = [5 6 5.5 7 8.5 8 6 7 7 5];
n = length(t);
s=0;
for k = 1:n-1
s = s + 0.5*[(t(k+1) - t(k)).*(v(k) + v(k+1))];
end

fprintf('s=%2.4f\n',s)

averagevelocity=s/10;
fprintf('Therefore Average Velocity is %2.4f m/s',averagevelocity)