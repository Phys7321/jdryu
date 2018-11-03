function [dy,xc] = Der(F,x,varargin)
% D calculates the derivative of the function F(x) using one of three
% methods: forward difference, central difference, and expolated difference
% D(F,x,method) returns the x and y coordinate of the derivative function.
% Specify which method in the optional third argument as 'fd', 'cd', or
% 'ed'. If F is a numeric vector, it is treated as data and a simple
% derivative is calculated

if isempty(varargin)
   % Default method
    varargin{1} = 'cd'; 
end
if ~isnumeric(x)
    error('Second input must be numeric vector')
end
if ~isa(F,'function_handle')
    if isnumeric(F)
      xc = chop(x, 'b'); % method for data depends on how you assign dy to xc
      dy = diff(F)./diff(x);
      if isequal(varargin{1},'d2')
          xc = chop(xc, 'f');
          dx = chop(diff(x), 'b');
          dy = diff(dy)./dx;
      end
      varargin{1} = 'data';
    else
      error('First input must be a function handle or a numeric array')
    end
end

n = length(x);
dx = diff(x);

switch varargin{1}
    case 'fd' 
        dy = (F(x(2:n)) - F(x(1:n-1)))./dx;
        xc = x(1:n-1);
    case 'bd'
        dy = (F(x(2:n)) - F(x(1:n-1)))./dx;
        xc = x(2:n);
    case 'cd'
        dy = (F(x(1:n-1)+0.5*dx) - F(x(1:n-1)-0.5*dx))./dx;
        xc = chop(x, 'b');
    case 'ed'
        half = (F(x(1:n-1)+0.25*dx) - F(x(1:n-1)-0.25*dx))./(0.5*dx); 
        full = (F(x(1:n-1)+0.5*dx) - F(x(1:n-1)-0.5*dx))./dx;
        dy = (4/3).*half - (1/3).*full;
        xc = chop(x, 'b');
    case 'd2'
        dx = chop(dx, 'b');
        xc = chop(x, 'f');
        xc = chop(xc, 'b');
        dy = (F(x(3:n)) - 2*F(x(2:n-1)) + F(x(1:n-2)))./(dx.^2);
    case 'o2'
        dx = chop(dx, 'b');
        xc = chop(x, 'f');
        xc = chop(xc, 'b');
        dy = (0.5*F(x(2:n-1)+dx) - 0.5*F(x(2:n-1)-dx))./dx;
    case 'o3'
        dx = chop(dx, 'b');
        xc = chop(x, 'f');
        xc = chop(xc, 'b');
        dy = ((1/24)*F(x(2:n-1)-(3/2)*dx) - (27/24)*F(x(2:n-1)-(1/2)*dx) ...
            + (27/24)*F(x(2:n-1)+(1/2)*dx) - (1/24)*F(x(2:n-1)+(3/2)*dx))./dx;
    case 'o4'
        dx = chop(dx, 'f');
        dx = chop(dx, 'b');
        xc = chop(x, 'f');
        xc = chop(xc, 'b');
        xc = chop(xc, 'b');        
        dy = ((1/12)*F(x(2:n-2)-2*dx) - (2/3)*F(x(2:n-2)-dx) ...
            + (2/3)*F(x(2:n-2)+dx) - (1/12)*F(x(2:n-2)+2*dx))./dx;        
    case 'data'
        return;
    otherwise
        error('method not recognized');
end
end