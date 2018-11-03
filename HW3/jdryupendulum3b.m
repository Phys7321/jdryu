% HW3.1 d
% @jdryu
 
% initializing values
m = 1;
g = 9.81;
w0sq = 9;   % w_0 squared
l = g / w0sq;

theta0 = 0.1;
thetad0 = 0;
[period, sol1] = pendulum(m, l, theta0, thetad0, 0, 0);

theta0 = 0.2;
thetad0 = 0.4;
[period, sol2] = pendulum(m, l, theta0, thetad0, 0, 0);

theta0 = 0.3;
thetad0 = 0.6;
[period, sol3] = pendulum(m, l, theta0, thetad0, 0, 0);

theta0 = -0.4;
thetad0 = -0.8;
[period, sol4] = pendulum(m, l, theta0, thetad0, 0, 0);

theta0 = -0.5;
thetad0 = -1.0;
[period, sol5] = pendulum(m, l, theta0, thetad0, 0, 0);

theta0 = -0.6;
thetad0 = -1.2;
[period, sol6] = pendulum(m, l, theta0, thetad0, 0, 0);

theta0 = -0.7;
thetad0 = 1.4;
[period, sol7] = pendulum(m, l, theta0, thetad0, 0, 0);

theta0 = 0.8;
thetad0 = -1.6;
[period, sol8] = pendulum(m, l, theta0, thetad0, 0, 0);

figure
plot(sol1(:,2), sol1(:,3), sol2(:,2), sol2(:,3), sol3(:,2), sol3(:,3), sol4(:,2), sol4(:,3), sol5(:,2), sol5(:,3), sol6(:,2), sol6(:,3), sol7(:,2), sol7(:,3), sol8(:,2), sol8(:,3))
title('Phase space')
xlabel('theta')
ylabel('thetad')
