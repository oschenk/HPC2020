% Graph Partitioning Toolbox. 
% 
% Datasets
%   2d_meshes        -  Graphs from aeronautics applications
%   Mesh_generation  -  Simple 2d and 3d mesh generation routines
%   read_csv_graphs  -  read csv lists and consruct the corresponding graphs
% 
% External
%   metismex - Interface between Metis 5.0.2 and Matlab
% 
% Bisection methods.
%   bisection_spectral   - Spectral bisection
%   bisection_coordinate - Coordinate bisection.
%   bisection_inertial   - Inertial bisection.
%   bisection_metis      - Multilevel method from Metis.
%   partition            - Partition points by a plane.
% 
% Multiway partitions.
%   rec_bisection  - Use any bisection method to get a multiway partition.
% 
% 
% Benchmark scripts
%   Bench_bisection        - Compare various graph bisection algorithms
%   Bench_eigen_plot       - Visualize information from the eigenspectrum 
%                            of the graph Laplacian
%   Bench_metis_comparison - Compare recursive bisection and direct k-way partitioning,
%                            as implemented in the Metis 5.0.2 library.
%   Bench_rec_bisection    - Benchmark for recursively partitioning meshes, based on various
%                            bisection approaches
% 
% 
% Visualization and graphics.
%   gplotpart      - Draw a 2-way partition.
%   gplotmap       - Draw a multiway partition.
%   highlight      - Draw a mesh with some vertices highlighted.
%   gplotg         - Draw a 2D or 3D mesh (replaces Matlab's gplot).
%   spypart        - Matrix spy plot with partition boundaries.
%  
% Miscellaneous.
%   cutsize                 - Find or count edges cut by a partition.
%   other                   - Other side of a partition.
%   adjacency_to_incidence  - create the incidence matrix of the graph
%   Contents                - contents of the partitioning toolbox 
%   blockdiags              - Create matrix with specified block diagonals.

