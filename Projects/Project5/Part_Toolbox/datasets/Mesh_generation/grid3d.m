function [A,xyz] = grid3d(k)
% GRID3D : Generate 3-dimensional 7-point finite difference mesh.
%
% [A,xyz] = GRID3D(k) returns a k^3-by-k^3 symmetric positive definite 
%        matrix A with the structure of the k-by-k-by-k 7-point grid,
%        and an array xyz of coordinates for the grid points.


a  = blockdiags ([-1 6 -1], -1:1, k, k);
I  = speye (k, k);
aa = blockdiags ([-I a -I], -1:1, k, k);
II = speye(k^2,k^2);
A  = blockdiags ([-II aa -II], -1:1, k, k);

A  = diag(diag(A)) - A;


xyz = zeros(k^3,3);
x   = ones(k,1) * (1:k);
y   = x';

j   = 1;
for i = 1:k
    xyz(j:j+k^2-1 , 1) = x(:);
    xyz(j:j+k^2-1 , 2) = y(:);
    xyz(j:j+k^2-1 , 3) = i * ones(k^2,1);
    j = j + k^2;
end


end
