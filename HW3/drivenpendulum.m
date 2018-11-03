function [period,sol] = drivenpendulum(mass,R,theta0,thetad0,gam0,omg) 
% Finds the period of a nonlinear pendulum given the length of the pendulum
% arm and initial conditions. All angles in radians.
 
% Setting initial conditions
if nargin==0
    error('Must input length and initial conditions')
end
if nargin==1
    theta0 = pi/2;
    thetad0=0;
    gam0=0;
    omg=0;
end
if nargin==2
    thetad0 = 0;
    gam0=0;
    omg=0;
end
if nargin==3
    gam0=0;
    omg=0;
end
if nargin==4
    omg=0;
end

g=9.81;
omega = sqrt(g/R);
T= 2*pi/omega;
% number of oscillations to graph
N = 20;
 
tspan = [0 N*T];
opts = odeset('refine',6);
r0 = [theta0 thetad0];
[t,w] = ode45(@proj,tspan,r0,opts,mass,g,R,gam0,omg);
K = mass/2.*w(:,2).^2;
V = ((mass/2)*(g/R)).*w(:,1).^2;
sol = [t,w,K,V];
ind= find(w(:,2).*circshift(w(:,2), [-1 0]) <= 0);
ind = chop(ind,4);
period= 2*mean(diff(t(ind)));
end
%-------------------------------------------
%
function rdot = proj(t,r,mass,g,R,gam0,omg)
    rdot = [r(2); -g/R*sin(r(1)) - gam0*r(2) + mass*1*cos(omg*t)];
end