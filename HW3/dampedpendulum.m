function [period,sol] = dampedpendulum(mass,R,theta0,thetad0,gam0) 
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
end
if nargin==2
    thetad0 = 0;
    gam0=0;
end
if nargin==3
    gam0=0;
end
g=9.81;
omega = sqrt(g/R);
T= 2*pi/omega;
% number of oscillations to graph
N = 10;
 
 
tspan = [0 N*T];
opts = odeset('events',@events,'refine',6);
r0 = [theta0 thetad0];
[t,w] = ode45(@proj,tspan,r0,opts,g,R,gam0);
K = mass/2.*w(:,2).^2;
V = ((mass/2)*(g/R)).*w(:,1).^2;
sol = [t,w,K,V];
ind= find(w(:,2).*circshift(w(:,2), [-1 0]) <= 0);
ind = chop(ind,4);
period= 2*mean(diff(t(ind)));
end
%-------------------------------------------
%
function rdot = proj(t,r,g,R,gam0)
    rdot = [r(2); -g/R*sin(r(1)) - gam0*r(2)];
end

function [value,isterminal,direction] = events(t,r,g,R,gam0)
value = r(2) - 0.0001;     % detect height = 0
isterminal = 1;   % stop the integration
direction = -1;   % negative direction
end
 