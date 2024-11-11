% Euler's method with step size dt for calculating velocity

dv1 = @(v) 9.81+0.25*v^2/68.1;
dv2 = @(v) 9.81-0.25*v^2/68.1;
% Step size 
dt = 0.5; 

t=0:dt:12;
v=zeros(1,max(size(t)));
b=zeros(1,max(size(t)));  % for analytical solution
b(1)=-40; 
v(1)=-40;
for i=2:max(size(t))
    if t(i)<3.5
        b(i)=51.6938*tan(0.18977*t(i)-0.65855235);
        v(i)=v(i-1)+dt*dv1(v(i-1));
    else
        b(i)=51.6938*tanh(0.18977*t(i)-0.65856);
        v(i)=v(i-1)+dt*dv2(v(i-1));
    end
  
end

plot(t,v);
xlabel('Time [s]');
ylabel('Velocity [m/s]');