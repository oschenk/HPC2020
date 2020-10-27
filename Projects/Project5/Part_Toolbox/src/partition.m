function [a,b] = partition(xyz,v)
% PARTITION : Partition points by a plane.
%
% [a,b] = partition(xyz,v):
% Each row of xyz is an input point in d-space.
% Input v is a vector, giving a direction normal to the partitioning plane.
%
% The output is two vectors of integers, 
% the indices of the points on each side of the plane.  
% Points on the plane are assigned to balance the cut.


[n,d] = size(xyz);

v = v(:); % Make v a column vector

if length(v) ~= d
    error('v must be a d-vector')
end;

dotprod = xyz * v;
split = median(dotprod);
a = find(dotprod <  split);
b = find(dotprod > split);
c = find(dotprod == split);
nc = length(c);
if nc
    na = length(a);
    nca = max([ceil(n/2)-na, 0]);
    nca = min(nca,nc);
    if nca > 0
        a = [a; c(1:nca)];
    end;
    if nca < nc
        b = [b; c(nca+1:nc)];
    end;
end;
a = a';
b = b';
