x = linspace(-5, 5, 100);
y = linspace(-5, 5, 100);
[xx, yy] = meshgrid(x, y);
f1 = @(a, i, j) (2 * a) ./ sqrt((a-i).^2+j.^2);
Z1 = zeros(100, 100);
for i = 1:100
    for j = 1:100
        b = xx(i,j);
        c = yy(i,j);
        int = integral(@(a) f1(a, b, c), 0, 1);
        if int > 2.5
            Z1(i,j) = 2.5;
        else
            Z1(i,j) = int;
        end
    end
end

figure
contour(xx, yy, Z1, 20)
title("Electric field and potential for line charge (units of k)")
colorbar()
xlabel('x')
ylabel('y')
[U1, V1] = gradient(Z1);
hold on
quiver(xx, yy, U1, V1);
hold off

f2x = @(a, i, j) (a.^2) ./ sqrt((a-i).^2+j.^2);
f2y = @(a, i, j) (a) ./ sqrt(i.^2+(a-j).^2);
Z2 = zeros(100, 100);
for i = 1:100
    for j = 1:100
        b = xx(i,j);
        c = yy(i,j);
        int = integral(@(a) f2x(a, b, c), 0, 1);
        int = int + integral(@(a) f2y(a, b, c), 1, 2);
        if int > 2.5
            Z2(i,j) = 2.5;
        else
            Z2(i,j) = int;
        end
    end
end

figure
contour(xx, yy, Z2, 20);
title("Electric field and potential for L charge (units of k)")
colorbar()
xlabel('x')
ylabel('y')
[U2, V2] = gradient(Z2);
hold on
quiver(xx, yy, U2, V2);
hold off

f3 = @(a, b, i, j) a ./ sqrt((a-i).^2+(b-j).^2);
Z3 = zeros(100, 100);
ymin = @(x) -sqrt(4-x.^2);
ymax = @(x) sqrt(4-x.^2);
for i = 1:100
    for j = 1:100
        c = xx(i,j);
        d = yy(i,j);
        int = integral2(@(a, b) f3(a, b, c, d), -2, 2, ymin, ymax);
        if int > 5
            Z3(i,j) = 5;
        elseif int < -5
            Z3(i,j) = -5;
        else
            Z3(i,j) = int;
        end
    end
end

figure
contour(xx, yy, Z3, 20);
title("Electric field and potential for disk charge (units of k)")
colorbar()
xlabel('x')
ylabel('y')
[U3, V3] = gradient(Z3);
hold on
quiver(xx, yy, U3, V3);
hold off
