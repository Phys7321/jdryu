% HW3.1 a-c
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
 
ind = find(sol(:,1)>=period);
% maxdelE = max(abs(delE(1:ind(1))))
 
figure
plot(sol(:,1)./period, delE)
xlim([0 1])
title('Relative change of total energy over time')
xlabel('t (multiples of the period)')
ylabel('(E-E0)/E0')
 
% avgT = mean(sol(1:ind(1),4));
% avgV = mean(sol(1:ind(1),5));
 
figure
plot(sol(:,1)./period, sol(:,2), sol(:,1)./period, sol(:,3), sol(:,1)./period, sol(:,4), sol(:,1)./period, sol(:,5))
title('Position and velocity')
legend({'position', 'velocity', 'avg kinetic', 'avg potential'})
xlabel('t (multiples of period)')
