% James Yu @jdryu 
% HW01-Differences

x = linspace(-5,10,500);
y = @(x) sin(sin(1./(x.*(2-x))));
[dyf,dxf] = Der(y,x,'fd');
[dyb,dxb] = Der(y,x,'bd');
[dyc,dxc] = Der(y,x,'cd');
[dy2,dx2] = Der(y,x,'o2');
[dy3,dx3] = Der(y,x,'o3');
[dy4,dx4] = Der(y,x,'o4');

[ddy,ddx] = Der(y,x,'d2');

[dY,dX] = Der(Y,X,'data');

[ddY,ddX] = Der(Y,X,'d2');

figure
plot(x,y(x))
title('sin^2(1/(x*(2-x)))')
legend('y(x)','Location','north')

figure
plot(dxf,dyf,dxb,dyb,dxc,dyc,dx2,dy2,dx3,dy3,dx4,dy4)
title('derivative of sin^2(1/(x*(2-x)))')
legend('fd','bd','cd','o2','o3','o4','Location','east')

figure
plot(ddx,ddy)
title('second derivative of sin^2(1/(x*(2-x)))')
legend('d2','Location','north')

figure
plot(X,Y)
title('derdata')
legend('Y','Location','north')

figure
plot(dX,dY)
title('derivative of derdata')
legend('d1','Location','north')

figure
plot(ddX,ddY)
title('second derivative of derdata')
legend('d2','Location','north')


