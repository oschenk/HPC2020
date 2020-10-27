function [part1,part2] = bisection_coordinate(A,xy,picture)
% COORDPART : Coordinate bisection partition of a mesh.
%
% [part1,part2] = bisection_coordinate(A,xy,picture) returns a list of the vertices on one side of a partition
%     obtained by bisection perpendicular to a coordinate axis.  We try every
%     coordinate axis and return the best cut.
%     Input A is the adjacency matrix of the mesh; 
%     each row of xy is the coordinates of a point in d-space.
%
% coordpart(A,xy,1) also draws a picture.

d = size(xy,2);
best_cut = inf;
for dim = 1:d
    v = zeros(d,1);
    v(dim) = 1;
    [p1,part2] = partition(xy,v);
    this_cut   = cutsize(A,p1);
    if this_cut < best_cut
        best_cut = this_cut;
        part1 = p1;
    end
end

if picture
    clf reset
    gplotpart(A,xy,part1);
    title('Coordinate bisection')
end


end