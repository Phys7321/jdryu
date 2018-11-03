function y = chop(x, varargin)
% truncates one element at the front ('f') or end ('b') of the input array

n = length(x);

if isempty(varargin)
   % Default method
    varargin{1} = 'b'; 
end

switch varargin{1}
    case 'f' 
        y = x(2:n);
    case 'b'
        y = x(1:n-1);
end
