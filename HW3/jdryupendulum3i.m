% HW3.5
% @jdryu
 
% initializing values
m = 1;
g = 9.81;
w0sq = 9;   % w_0 squared
l = g / w0sq;
theta0 = 0;
thetad0 = 0;
gam0 = 0.5;
omg = [0 1.0 2.0 2.2 2.4 2.6 2.8 3.0 3.2 3.4];
amps = zeros(1,10);
for i = 1:10
    [period, sol] = drivenpendulum(m, l, theta0, thetad0, gam0, omg(i));
    theta = sol(end-400:end,2);
    amps(i) = max(theta);
end

figure
plot(omg, amps)
xlabel('omega')
ylabel('amplitude')

omg = (2:0.01:4);
n = size(omg);
amps = zeros(1,n(2));
for i = 1:n(2)
    [period, sol] = drivenpendulum(m, l, theta0, thetad0, gam0, omg(i));
    theta = sol(end-400:end,2);
    amps(i) = max(theta);
end

figure
plot(omg, amps)
xlabel('omega')
ylabel('amplitude')

[maxamp,ind] = max(amps);
inds = find(amps<=maxamp/sqrt(2));
d = 0;
i = 0;
while d <= 1
    i = i + 1;
    d = inds(i) - i;
end
domg0 = omg(inds(i)) - omg(inds(i-1));

gam1 = 0.1;
gam2 = 0.5;
gam3 = 1.0;
gam4 = 2.0;

amps1 = zeros(1,n(2));
for i = 1:n(2)
    [period, sol] = drivenpendulum(m, l, theta0, thetad0, gam1, omg(i));
    theta = sol(end-400:end,2);
    amps1(i) = max(theta);
end
[maxamp1,ind1] = max(amps1);
inds1 = find(amps1<=maxamp1/sqrt(2));
d = 0;
i = 0;
while d <= 1
    i = i + 1;
    d = inds1(i) - i;
end
domg1 = omg(inds1(i)) - omg(inds1(i-1));

amps2 = zeros(1,n(2));
for i = 1:n(2)
    [period, sol] = drivenpendulum(m, l, theta0, thetad0, gam2, omg(i));
    theta = sol(end-400:end,2);
    amps2(i) = max(theta);
end
[maxamp2,ind2] = max(amps2);
inds2 = find(amps2<=maxamp2/sqrt(2));
d = 0;
i = 0;
while d <= 1
    i = i + 1;
    d = inds2(i) - i;
end
domg2 = omg(inds2(i)) - omg(inds2(i-1));

amps3 = zeros(1,n(2));
for i = 1:n(2)
    [period, sol] = drivenpendulum(m, l, theta0, thetad0, gam3, omg(i));
    theta = sol(end-400:end,2);
    amps3(i) = max(theta);
end
[maxamp3,ind3] = max(amps3);
inds3 = find(amps3<=maxamp3/sqrt(2));
d = 0;
i = 0;
while d <= 1
    i = i + 1;
    d = inds3(i) - i;
end
domg3 = omg(inds3(i)) - omg(inds3(i-1));

amps4 = zeros(1,n(2));
for i = 1:n(2)
    [period, sol] = drivenpendulum(m, l, theta0, thetad0, gam4, omg(i));
    theta = sol(end-400:end,2);
    amps4(i) = max(theta);
end
[maxamp4,ind4] = max(amps4);
inds4 = find(amps4<=maxamp4/sqrt(2));
d = 0;
i = 0;
while d <= 1
    i = i + 1;
    d = inds4(i) - i;
end
if i <= 1
    domg4 = omg(inds4(1));
else
    domg4 = omg(inds4(i)) - omg(inds4(i-1));
end

figure
plot([gam0 gam1 gam2 gam3 gam4],[domg0/omg(ind) domg1/omg(ind1) domg2/omg(ind2) domg3/omg(ind3) domg4/omg(ind4)])
xlabel('gamma')
ylabel('delta omega / omega max')

figure
plot([gam0 gam1 gam2 gam3 gam4],[maxamp maxamp1 maxamp2 maxamp3 maxamp4])
xlabel('gamma')
ylabel('max amplitude')
