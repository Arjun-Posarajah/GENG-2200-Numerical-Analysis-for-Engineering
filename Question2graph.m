t= linspace(0,2);
ft=@(t) 9*exp(-t).*cos(2*pi*t)-3;
y=ft(t);
plot(t,y),grid

%Roots at about t=0.18, 0.9, 1.05
%Fzero can be used to obtain refined estimates
t=fzero(ft,[0 0.2])
t=fzero(ft,[0.5 1])
t=fzero(ft,[1 1.5])