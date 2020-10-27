function B = setfilter(A)
% SETFILTER : Sort and remove duplicates.
%
% B = setfilter(A) returns a row vector with one occurrence
%     of each different element of A, in sorted order.


if length(A) == 0
    B = []; 
    return;
end;

B = sort(A(:));
B(find(diff(B)==0)) = [];
B = B.';
