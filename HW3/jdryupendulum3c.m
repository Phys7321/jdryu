% HW3.2
% @jdryu
 
% initializing values
m = 1;
g = 9.81;
w0sq = 9;   % w_0 squared
l = g / w0sq;
theta0 = 0.25;
thetad0 = 0;
 
[period, sol] = pendulum(m, l, theta0, thetad0, 0, 0);
 
E0 = sol(1,4) + sol(1,5);
 
delE = ((sol(:,4)+sol(:,5))-E0)./E0;

figure
plot(sol(:,1)./period, delE)
xlim([0 1])
title('Relative change of total energy over time')
xlabel('t (multiples of the period)')
ylabel('(E-E0)/E0')

theta0 = 0.1;
[period1, sol1] = pendulum(m, l, theta0, thetad0, 0, 0);

theta0 = 0.2;
[period2, sol2] = pendulum(m, l, theta0, thetad0, 0, 0);

theta0 = 0.4;
[period3, sol3] = pendulum(m, l, theta0, thetad0, 0, 0);

theta0 = 0.8;
[period4, sol4] = pendulum(m, l, theta0, thetad0, 0, 0);

theta0 = 1.0;
[period5, sol5] = pendulum(m, l, theta0, thetad0, 0, 0);

figure
plot(sol1(:,1), sol1(:,2), sol2(:,1), sol2(:,2), sol3(:,1), sol3(:,2), sol4(:,1), sol4(:,2), sol5(:,1), sol5(:,2))
title('Position vs time')
xlabel('t')
ylabel('theta')

figure
plot(sol1(:,1), sol1(:,3), sol2(:,1), sol2(:,3), sol3(:,1), sol3(:,3), sol4(:,1), sol4(:,3), sol5(:,1), sol5(:,3))
title('Velocity vs time')
xlabel('t')
ylabel('d(theta)/dt')

figure
plot([max(sol1(:,2)) max(sol2(:,2)) max(sol3(:,2)) max(sol4(:,2)) max(sol5(:,2))], [period1 period2 period3 period4 period5], [max(sol1(:,2)) max(sol5(:,2))], [2*pi/3 2*pi/3])
title('Period vs Amplitude')
xlabel('Max amplitude')
ylabel('Period')
legend('Nonlinear Sol.', 'Linear Approx.')