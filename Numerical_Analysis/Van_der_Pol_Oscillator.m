clear;

mu = 1                % strength of damping

% TIME INTERVALS
N = 1001;
t = linspace(0,50,N); % creates 1000000 time intervals
dt = t(2)-t(1);       % length of time interval dt = 0.00005

% VECTORS FOR VAlUES AT TIME T
x = zeros(N,1);       % initialise zero 1000001x1 vectors
y = x;

% INITIAL CONDITIONS
x(1) = 1;             % x(t=0) = f(t=0) = 1 so first entry is 1
y(1) = 0;             % y(t=0) = f'(t=0) = 0 so first entry is 0

% CALCULATES X AND Y AT TIME T
for i = 1:N-1
    x(i+1) = x(i) + dt*y(i);
    y(i+1) = y(i) + dt*(-x(i) + mu*(1-(x(i))^2)*y(i));
end

% PLOTS VALUES OF X (F) AT T
plot(t,x)
grid on
ylabel('f(t)')
xlabel('t')