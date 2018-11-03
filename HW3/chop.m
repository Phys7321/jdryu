function y = chop(x, varargin)
% truncates varargin{1} elements from the end of the input array
 
n = length(x);
 
if isempty(varargin)
   % Default method
    varargin{1} = 1; 
end
 
y = x(1:n-varargin{1});
 
end
