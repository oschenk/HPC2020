function handle = gplotg(A,xy,lc)
% GPLOTG : Plot a "graph theoretic" graph.
%
%	handle = gplotg(A,xy) plots the graph specified by A and xy.
%	A graph, G, is a set of nodes numbered from 1 to n,
%	and a set of connections, or edges, between them.
%	In order to plot G, two matrices are needed.
%	The adjacency matrix, A, has a(i,j) nonzero if and
%	only if node i is connected to node j.  The coordinates
%	array, xy, is an n-by-2 or n-by-3  matrix with the position 
%       for node i in the i-th row, xy(i,:) = [x(i) y(i)],
%                               or  xy(i,:) = [x(i) y(i) z(i)].
%	
%	gplotg(A,xy,lc) uses line type and color instead of the 
%	default, 'r-'.   For example, lc = 'g:'.  See PLOT.



if nargin < 3, 
    lc = 'r-';
end;

[i,j] = find(A);
[ignore, p] = sort(max(i,j));
i = i(p);
j = j(p);

% Create a long, NaN-seperated list of line segments,
% rather than individual segments.

X = [ xy(i,1) xy(j,1) NaN*ones(size(i))]';
Y = [ xy(i,2) xy(j,2) NaN*ones(size(i))]';
X = X(:);
Y = Y(:);

if size(xy,2) == 2
    h = plot (X, Y, lc);
else
    set(gca,'drawmode','fast');
    Z = [ xy(i,3) xy(j,3) NaN*ones(size(i))]';
    Z = Z(:);
    h = plot3 (X, Y, Z, lc);
end;

axis equal;
axis off;
if nargout >= 1
    handle = h;
end;
