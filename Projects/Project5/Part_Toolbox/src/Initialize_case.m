function [params] =  Initialize_case(SM_case)

% Adjacency
params.Adj    = SM_case.Problem.A;
% Incidence
params.Inc    = adjacency_to_incidence(params.Adj);
% Edges
params.numberOfEdges = size(params.Inc,1);
% Vertices
params.numberOfVertices = size(params.Inc,2);
% coords (if exist)
if isfield(SM_case, 'Problem') && isfield(SM_case.Problem, 'aux') && ...
   isfield(SM_case.Problem.aux, 'coord')
    params.coords = SM_case.Problem.aux.coord;
end
    
    
end