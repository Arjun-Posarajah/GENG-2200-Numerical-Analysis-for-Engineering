%----Forming the coefficient Matrix A----

%----------------------------
A=zeros(10);
A(1,1)=1;A(1,2)=1;
 A(2,3)=1;A(2,4)=1;
A(3,5)=1;A(3,6)=0.6;
 A(4,4)=-1;A(4,6)=-0.8;
 A(5,5)=-1;A(5,7)=0.6;
 A(6,7)=-0.8;A(6,8)=-1;
 A(7,2)=-1;A(7,6)=-0.6;A(7,9)=1;
 A(8,6)=0.8;A(8,8)=1;
 A(9,7)=-0.6;A(9,9)=-1;
A(10,7)=0.8;A(10,10)=1;
%---Forming the load vector f-----
%--------------------------
f=zeros([10,1]);
 f(3)=-74;
 f(6)=24;
% -----Forming the Augmented coefficient matrix including the load vector---
%---------------------------
A(:,11)=f;
% ----Main Programme-----
%----------------------
 err=0; % For checking ill conditioning
 k=1;
n=10;
epsilon=1e-4;
v=linspace(1,10,10);
 while err==0&k<10;
[v]=NewPivot(A,n,k,v);% Caling the partial pivoting function
r=v(k);
%-----Checking for ill conditioning
%---------------------------
if abs(A(r,k))<epsilon;
err=1;
end;
% LU Decomposition starts-----
%--------------------------------
for z=k+1:n;
ii=v(z);
A(ii,k)=A(ii,k)/A(r,k);
for jj=k+1:n+1;
A(ii,jj)=A(ii,jj)-A(ii,k)*A(r,jj);
end
end
k=k+1;
end
% As is LU decomposed matrix (combined)-----
%----------------------------
for ii=1:n;
As(ii,:)= A(v(ii),:);
end
% Separation of L (lower triangular)
%-------------------------------
L=zeros([10,10]);
for k=1:n
for jj=1:k-1
L(k,jj)=As(k,jj);
end
end
L=L+eye(10,10);
% Separation of U (upper triangular)---
%-------------------------
U=zeros(10,10);
for k=1:n
for jj=k:n
U(k,jj)=As(k,jj);
end
end
% ---Formation of rearranged load vector fss
%-----------------------------
for ii=1:n;
fss(ii)=f(v(ii));
end
%--Forward substitution----
%-----------------------
[g]=FowdSubs( L,n,fss);
%--- Backward substitution---
%------------------------
[x]= BackSubs( U,g,n);

g
x

Function NewPivot

function [ v] = NewPivot(A,n,k,v )

%UNTITLED2 Summary of this function goes here
% Detailed explanation goes here
r=v(k);
m=r;
amax=abs(A(r,k));
for jj=k+1:n;
ii=v(jj);
if abs(A(ii,k))>amax;
amax=abs(A(ii,k));
m=jj;
nn=jj;
end
end
if m~=r;
v(k)=v(m);
v(m)=r;

end

Function FowdSubs

function [ g] = FowdSubs( L,n,fss)
%UNTITLED2 Summary of this function goes here
% Detailed explanation goes here
g=zeros([10,1]);
g(1)=fss(1);
for k=2:n;
z=fss(k);
for jj=1:k-1;
z=z-L(k,jj)*g(jj);
end;
g(k)=z/L(k,k);
end;
  
end

Function BackSubs

function [ x ] = BackSubs( U,g,n)
%UNTITLED Summary of this function goes here
% Detailed explanation goes here
x=zeros([10,1]);
x(n)=g(n);
for k=n-1:-1:1;
z=g(k);
for jj=k+1:n;
z=z-U(k,jj)*x(jj);
end;
x(k)=z/U(k,k);
end


end