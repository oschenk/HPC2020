% Script to load .csv lists of adjacency matrices and the corresponding 
% coordinates. 
% The resulting graphs should be visualized and saved in a .csv file.
% D.P & O.S for HPC in USI Lugano

addpaths_GP;

% Steps
% 1. Load the .csv files
help csvread
pause;
% 2. Construct the adjaceny matrix (NxN). There are multiple ways
%    to do so.
help accumarray
help sparse
pause;
% 3. Visualize the resulting graphs
help gplotg
pause;
% 4. Save the resulting graphs
help save
pause;


% Example of the desired graph format for CH

load Swiss_graph.mat

whos

figure;
gplotg(W,coords);
