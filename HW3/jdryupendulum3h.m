% HW3.4 c
% @jdryu
 
% initializing values
m = 1;
g = 9.81;
w0sq = 9;   % w_0 squared
l = g / w0sq;
theta0 = 1;
thetad0 = 0;
gam0 = 0.5;

omg = [0 1.0 2.0 2.2 2.4 2.6 2.8 3.0 3.2 3.4];
delta = zeros(1,10);
for i = 1:10
    [period, sol] = drivenpendulum(m, l, theta0, thetad0, gam0, omg(i));
    theta = sol(end-400:end,2);
    A0 = max(theta);
    delta(i) = mean(acos(theta./A0) - omg(i).*sol(end-400:end,1));
end

gam0p = 1.5;
deltap = zeros(1,10);
for i = 1:10
    [period, sol] = drivenpendulum(m, l, theta0, thetad0, gam0p, omg(i));
    theta = sol(end-400:end,2);
    A0 = max(theta);
    deltap(i) = mean(acos(theta./A0) - omg(i).*sol(end-400:end,1));
end

figure
% plot(sol(end-400:end,1),sol(end-400:end,2))
plot(omg,delta,omg,deltap)
xlabel('omega')
ylabel('delta')
