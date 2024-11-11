%Initial conditions 
    u0=[1;15];
    h=0.0625;
% Euler
        %min and max time span
        tspan=[0 4];
        %Euler function
        [t,s1]= eulerSystem(@(t,y) odelsol(t,y), tspan, u0,h);
        figure(1)
        hold on
        plot(t,s1(1,:),'linewidth',2)
        figure(2)
        hold on
        plot(t,s1(2,:),'linewidth',2)
      
% Midpoint
        %min and max time span
        tspan=[0 4];
        %Midpoint function
        [t,s1]= midpoint(@(t,y) odelsol(t,y), tspan, u0,h);
        figure(1)
        hold on
        plot(t,s1(1,:),'linewidth',2)
        figure(2)
        hold on
        plot(t,s1(2,:),'linewidth',2)
      
% Runge Kutta 4
        %min and max time span
        tspan=[0 4];
        %Runge Kutta 4 matlab function
        [t,s1]= RK4System(@(t,y) odelsol(t,y), tspan, u0,h);
        figure(1)
        hold on
        plot(t,s1(1,:),'linewidth',2)
        xlabel('t')
        ylabel('C(t)')
        title('t vs. C(t) plot')
        legend('Euler','Midpoint','RK4')
        box on; grid on
        figure(2)
        hold on
        plot(t,s1(2,:),'linewidth',2)
        xlabel('t')
        ylabel('T(t)')
        title('t vs. T(t) plot')
        legend('Euler','Midpoint','RK4')
        box on; grid on

%evaluating the ode
function dydt = odelsol(t,y)

    eq1 = -exp(-10./(y(2)+273)).*y(1);
    eq2 = 1000.*exp(-10./(y(2)+273)).*y(1)-10.*(y(2)-20);

    %Evaluate for our conditions
    dydt = [eq1;eq2];
end

%Euler Systems
function [t,y]= eulerSystem(Func,Tspan,Y0,h)

    %initial
    t0= Tspan(1);
    tf= Tspan(2);
    N=(tf-t0)/h ;
    t=t0:h:tf;
    y=zeros(length(Y0),N+1);
    y(:,1) = Y0;

    % Using Euler
    for i=1:N
        y(:,i+1)=y(:,i)+h*Func(t(i),y(:,i));
    end
end

%Runge Kutta 4 system for multidim prob
function [t,y]=RK4System(Func,Tspan,Y0,h)

    %initial
    t0= Tspan(1);
    tf= Tspan(2);
    N=(tf-t0)/h ;
    t=t0:h:tf;
    y=zeros(length(Y0),N+1);
    y(:,1) = Y0;
  
    for i=1:N
        k1=Func(t(i),y(:,i));
        k2=Func(t(i)+h/2,y(:,i)+h*k1/2);
        k3=Func(t(i)+h/2,y(:,i)+h*k2/2);
        k4=Func(t(i)+h,y(:,i)+h*k3);
        y(:,i+1)=y(:,i)+h*(k1+2*k2+2*k3+k4)/6;
    end
  
  
end

%Midpoint system for multidim prob
function [t,y]=midpoint(Func,Tspan,Y0,h)

    %initial
    t0= Tspan(1);
    tf= Tspan(2);
    N=(tf-t0)/h ;
    t=t0:h:tf;
    y=zeros(length(Y0),N+1);
    y(:,1) = Y0;
  
    for i=1:N
        k1=h*Func(t(i),y(:,i));
        k2=h*Func(t(i)+h/2,y(:,i)+k1/2);
        y(:,i+1)=y(:,i)+k2;
    end
end