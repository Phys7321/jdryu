% HW3.4 a-b
% @jdryu
 
% initializing values
m = 1;
g = 9.81;
w0sq = 9;   % w_0 squared
l = g / w0sq;

theta01 = 1;
thetad01 = 0;
omg = 2;
gam0 = 0.5;
[period1, sol1] = drivenpendulum(m, l, theta01, thetad01, gam0, omg);

theta02 = 0;
thetad02 = 1;
[period2, sol2] = drivenpendulum(m, l, theta02, thetad02, gam0, omg);

theta03 = 1;
thetad03 = 1;
[period3, sol3] = drivenpendulum(m, l, theta03, thetad03, gam0, omg);

figure
plot(sol1(:,1), sol1(:,2), sol2(:,1), sol2(:,2), sol3(:,1), sol3(:,2))
xlabel('time')
ylabel('position')

omg1 = 1;
[period4, sol4] = drivenpendulum(m, l, theta01, thetad01, gam0, omg1);
omg4 = 4;
[period5, sol5] = drivenpendulum(m, l, theta01, thetad01, gam0, omg4);
figure
plot(sol1(:,1), sol1(:,2), sol4(:,1), sol4(:,2), sol5(:,1), sol5(:,2))
xlabel('time')
ylabel('position')


