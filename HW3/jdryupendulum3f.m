% HW3.3 d
% @jdryu
 
% initializing values
m = 1;
g = 9.81;
w0sq = 9;   % w_0 squared
l = g / w0sq;

theta0 = 1;
thetad0 = 0;
gam4 = 4.0;
[perioddamp4, soldamp4] = pendulum(m, l, theta0, thetad0, gam4, 0);

gam5 = 5.0;
[perioddamp5, soldamp5] = pendulum(m, l, theta0, thetad0, gam5, 0);

gam6 = 6.0;
[perioddamp6, soldamp6] = pendulum(m, l, theta0, thetad0, gam6, 0);

gam7 = 7.0;
[perioddamp7, soldamp7] = pendulum(m, l, theta0, thetad0, gam7, 0);

gam8 = 8.0;
[perioddamp8, soldamp8] = pendulum(m, l, theta0, thetad0, gam8, 0);

figure
plot(soldamp4(:,1), soldamp4(:,2), soldamp5(:,1), soldamp5(:,2), soldamp6(:,1), soldamp6(:,2), soldamp7(:,1), soldamp7(:,2), soldamp8(:,1), soldamp8(:,2))
title('Position vs time')
xlabel('t')
ylabel('theta')

[perioddamp4, soldamp4] = dampedpendulum(m, l, theta0, thetad0, gam4);
[perioddamp5, soldamp5] = dampedpendulum(m, l, theta0, thetad0, gam5);
[perioddamp6, soldamp6] = dampedpendulum(m, l, theta0, thetad0, gam6);
[perioddamp7, soldamp7] = dampedpendulum(m, l, theta0, thetad0, gam7);
[perioddamp8, soldamp8] = dampedpendulum(m, l, theta0, thetad0, gam8);

figure
plot(soldamp4(:,1), soldamp4(:,2), soldamp5(:,1), soldamp5(:,2), soldamp6(:,1), soldamp6(:,2), soldamp7(:,1), soldamp7(:,2), soldamp8(:,1), soldamp8(:,2))
title('Position vs time')
xlabel('t')
ylabel('theta')

gam0 = 0.5;
gam2 = 2.0;

[perioddamp0, soldamp0] = dampedpendulum(m, l, theta0, thetad0, gam0);
[perioddamp2, soldamp2] = dampedpendulum(m, l, theta0, thetad0, gam2);

figure
plot(soldamp0(:,2), soldamp0(:,3),soldamp2(:,2), soldamp2(:,3),soldamp4(:,2), soldamp4(:,3),soldamp6(:,2), soldamp6(:,3),soldamp8(:,2), soldamp8(:,3))
title('Phase space diagram')
xlabel('theta')
ylabel('thetad')
