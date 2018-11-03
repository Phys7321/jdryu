% HW3.3 c
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

K = sol(:,4);
V = sol(:,5);
Kdamp = soldamp(:,4);
Vdamp = soldamp(:,5);
Kdamp1 = soldamp1(:,4);
Vdamp1 = soldamp1(:,5);
Kdamp2 = soldamp2(:,4);
Vdamp2 = soldamp2(:,5);
Kdamp3 = soldamp3(:,4);
Vdamp3 = soldamp3(:,5);

ind1 = find(sol(:,1)<=period);
ind2 = find(sol(:,1)<=period*2);
ind3 = find(sol(:,1)<=period*3);
ind4 = find(sol(:,1)<=period*4);
ind5 = find(sol(:,1)<=period*5);
ind6 = find(sol(:,1)<=period*6);
ind7 = find(sol(:,1)<=period*7);
ind8 = find(sol(:,1)<=period*8);
ind9 = find(sol(:,1)<=period*9);
ind10 = find(sol(:,1)<=period*10);

Kavg = [mean(K(ind1)) mean(K(ind2)) mean(K(ind3)) mean(K(ind4)) mean(K(ind5)) mean(K(ind6)) mean(K(ind7)) mean(K(ind8)) mean(K(ind9)) mean(K(ind10))];
Kdampavg = [mean(Kdamp(ind1)) mean(Kdamp(ind2)) mean(Kdamp(ind3)) mean(Kdamp(ind4)) mean(Kdamp(ind5)) mean(Kdamp(ind6)) mean(Kdamp(ind7)) mean(Kdamp(ind8)) mean(Kdamp(ind9))];
Kdamp1avg = [mean(Kdamp1(ind1)) mean(Kdamp1(ind2)) mean(Kdamp1(ind3)) mean(Kdamp1(ind4)) mean(Kdamp1(ind5)) mean(Kdamp1(ind6)) mean(Kdamp1(ind7)) mean(Kdamp1(ind8))];
Kdamp2avg = [mean(Kdamp2(ind1)) mean(Kdamp2(ind2)) mean(Kdamp2(ind3)) mean(Kdamp2(ind4)) mean(Kdamp2(ind5)) mean(Kdamp2(ind6))];
Kdamp3avg = [mean(Kdamp3(ind1)) mean(Kdamp3(ind2)) mean(Kdamp3(ind3)) mean(Kdamp3(ind4)) mean(Kdamp3(ind5))];

Vavg = [mean(V(ind1)) mean(V(ind2)) mean(V(ind3)) mean(V(ind4)) mean(V(ind5)) mean(V(ind6)) mean(V(ind7)) mean(V(ind8)) mean(V(ind9)) mean(V(ind10))];
Vdampavg = [mean(Vdamp(ind1)) mean(Vdamp(ind2)) mean(Vdamp(ind3)) mean(Vdamp(ind4)) mean(Vdamp(ind5)) mean(Vdamp(ind6)) mean(Vdamp(ind7)) mean(Vdamp(ind8)) mean(Vdamp(ind9))];
Vdamp1avg = [mean(Vdamp1(ind1)) mean(Vdamp1(ind2)) mean(Vdamp1(ind3)) mean(Vdamp1(ind4)) mean(Vdamp1(ind5)) mean(Vdamp1(ind6)) mean(Vdamp1(ind7)) mean(Vdamp1(ind8))];
Vdamp2avg = [mean(Vdamp2(ind1)) mean(Vdamp2(ind2)) mean(Vdamp2(ind3)) mean(Vdamp2(ind4)) mean(Vdamp2(ind5)) mean(Vdamp2(ind6))];
Vdamp3avg = [mean(Vdamp3(ind1)) mean(Vdamp3(ind2)) mean(Vdamp3(ind3)) mean(Vdamp3(ind4)) mean(Vdamp3(ind5))];

cycles = [1 2 3 4 5 6 7 8 9 10];

figure
plot(cycles, Kavg, cycles(1:9), Kdampavg, cycles(1:8), Kdamp1avg, cycles(1:6), Kdamp2avg, cycles(1:5), Kdamp3avg)
title('Average Kinetic Energy vs Number of cycles')
xlabel('Average Kinetic Energy')
ylabel('Number of cycles')

figure
plot(cycles, Vavg, cycles(1:9), Vdampavg, cycles(1:8), Vdamp1avg, cycles(1:6), Vdamp2avg, cycles(1:5), Vdamp3avg)
title('Average Potential Energy vs Number of cycles')
xlabel('Average Potential Energy')
ylabel('Number of cycles')

figure
plot(cycles, Kavg+Vavg, cycles(1:9), Kdampavg+Vdampavg, cycles(1:8), Kdamp1avg+Vdamp1avg, cycles(1:6), Kdamp2avg+Vdamp2avg, cycles(1:5), Kdamp3avg+Vdamp3avg)
title('Average Total Energy vs Number of cycles')
xlabel('Average Total Energy')
ylabel('Number of cycles')