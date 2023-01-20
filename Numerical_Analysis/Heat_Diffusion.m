%%%% Q3 %%%%
clear;

x_data=101;                     % no. of data points for x
x=linspace(0,1,x_data)';        % 0 <= x <= 1
dx=x(2)-x(1);                   % dx = 0.01

t_data=20001;                   % no. of data points for t
t=linspace(0,1,t_data)';        % 0 <= t <= 1
dt=t(2,1)-t(1,1);               % dt = 0.0001

k=0.1;
c=1;

U=zeros(x_data,t_data);         % 101x20001 matrix
X=zeros(x_data,t_data);         % 101x20001 matrix
T=zeros(x_data,t_data);         % 101x20001 matrix

for i=1:1:x_data                % every integer up to x_data
    for j=1:1:t_data            % every integer up to t_data
        X(i,j)=x(i,1);          % each i-jth entry in X is ith entry in x
        T(i,j)=t(j,1);          % each i-jth entry in T is ith entry in t
    end                         % rows and columns of same number
end

U(:,1)=sin(2.*pi.*x);  % first column of U is sin(2pix), initial condition

L=zeros(x_data,x_data);         % x_data x x_data matrix of zeroes

A = dt*((k-(c*dx))/(dx^2));     % coefficient of T_i+1^n
B = 1 + dt*((-2*k+c*dx)/dx^2);  % coefficient of T_i^n
C = k*dt/dx^2;                  % coefficient of T_i-1^n

for i=2:1:x_data-1              % construct matrix
    L(i,i-1)=A;
    L(i,i)=B;
    L(i,i+1)=C;
end

L(1,1)=1;                       % top left and bottom right entries are 1
L(x_data,x_data)=1;

for j=2:1:t_data
    U(:,j)=L*U(:,j-1);
end

pcolor(X,T,U)
title('Numerical solution to given heat equation')
xlabel('x')
ylabel('t')
hold on
shading interp
