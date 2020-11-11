function x = pagerank(G,U)
% PAGERANK  Google's PageRank
% x = pagerank(U, G,p) uses the power method to compute the page
% rank for a connectivity matrix G with a damping factory p,
% (default is p = 0.85).
p = .85;

% Eliminate any self-referential links
G = G - diag(diag(G));
  
% c = out-degree
[n,n] = size(G);
c = sum(G,1);

% Form the components of the Markov transition matrix.
k = find(c~=0);
D = sparse(k,k,1./c(k),n,n);
G = p*G*D;
e = ones(n,1);
z = ((1-p)*(c~=0) + (c==0))/n;

% Power method to find Markov vector, A*x = x.
x = e/n;
it = 0;
xs = zeros(n,1);
while norm(x-xs,inf)> 1.e-6*norm(x,inf)
   xs = x;
   x = G*x + e*(z*x);
   it = it + 1;
   disp(['Iteration #', int2str(it), '; Error: ', num2str(norm(x-xs,inf))]);
end

%if nargin < 2 return

shg
bar(x)
title('Page Rank')

% Print URLs in page rank order.
if nargout < 1
   [~,q] = sort(-x);
   disp('     page-rank  in  out  url')
   k = 1;
   while (k <= n) && (x(q(k)) >= .005)
      j = q(k);
      temp1  = r(j);
      temp2  = c(j);
      fprintf(' %3.0f %8.4f %4.0f %4.0f  %s\n', j,x(j),full(temp1),full(temp2),U{j})
      k = k+1;   
   end
   
end







