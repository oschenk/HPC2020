function [part1,part2] = bisection_metis(A,xy,picture)
% METISPART : Partition a graph using Metis default method.
%
% p = metispart(A) returns a list of the vertices on one side of
%     a partition obtained by Metis 4.0 applied to the graph of A.
%     
% Optional arguments:
%   metispart(A,xy) draws a picture of the partitioned graph,
%                   using the rows of xy as vertex coordinates.
%   [p1,p2] = metispart(...)   also returns the list of vertices
%                              on the other side of the partition.
%
% See also METISMEX (which accepts all the Metis options), 


map = metismex('PartGraphRecursive',A,2);
[part1,part2] = other(map);

if picture
    gplotpart(A,xy,part1);
    title('Metis bisection')
end


end