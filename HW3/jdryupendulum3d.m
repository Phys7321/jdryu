% HW3.3 a-b
% @jdryu
 
% initializing values
m = 1;
g = 9.81;
w0sq = 9;   % w_0 squared
l = g / w0sq;
gam0 = 0.5;

theta0 = 1;
thetad0 = 0;
[period, sol] = pendulum(m, l, theta0, thetad0, 0, 0);
[perioddamp, soldamp] = pendulum(m, l, theta0, thetad0, gam0, 0);

gam1 = 1.0;
[perioddamp1, soldamp1] = pendulum(m, l, theta0, thetad0, gam1, 0);

gam2 = 2.0;
[perioddamp2, soldamp2] = pendulum(m, l, theta0, thetad0, gam2, 0);

gam3 = 3.0;
[perioddamp3, soldamp3] = pendulum(m, l, theta0, thetad0, gam3, 0);

figure
plot(sol(:,1), sol(:,2), soldamp(:,1), soldamp(:,2), soldamp1(:,1), soldamp1(:,2), soldamp2(:,1), soldamp2(:,2), soldamp3(:,1), soldamp3(:,2))
title('Position vs time')
xlabel('t')
ylabel('theta')

figure
plot([0 gam0 gam1 gam2 gam3],[period perioddamp perioddamp1 perioddamp2 perioddamp3])
title('Period vs Damping coefficient')
xlabel('Gamma')
ylabel('Period')