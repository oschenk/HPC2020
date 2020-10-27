function Bench_bisection()
    % Compare various graph bisection algorithms
    %
    % D.P & O.S for HPC in USI Lugano
    
    % add the necessaty paths
    addpaths_GP;
    
    warning('off','all');
    picture = 1;
    
    format compact;
    
    disp('          *********************************************')
    disp('          ***      Graph bisection benchmark        ***');
    disp('          *********************************************')
    disp(' ');
    disp(' Load and bisect sample meshes with coordinates.');
    disp(' ');
    
    
    whos;
    
    for nmesh = 1:5
        close all; clf reset;
        
        if (nmesh==1)
            disp(' ');
            disp(' Small mesh with 48 nodes and 129 edges.');
            disp(' ');
            disp('load mesh1e1.mat;');
            disp(' ');
            load mesh1e1.mat;
            W = Problem.A;
            coords = Problem.aux.coord;
        end
        if (nmesh==2)
            disp(' ');
            disp(' Small mesh with 306 nodes and 856 edges.');
            disp(' ');
            disp('load mesh2e1.mat;');
            disp(' ');
            load mesh2e1.mat;
            W = Problem.A;
            coords = Problem.aux.coord;
        end
        if (nmesh==3)
            disp(' ');
            disp(' Structural graph with 615 nodes and 864 edges.');
            disp(' ');
            disp('load netz4504_dual.mat;');
            disp(' ');
            load netz4504_dual.mat;
            W = Problem.A;
            coords = Problem.aux.coord;
        end
        if (nmesh==4)
            disp(' ');
            disp(' Structural graph with 1306 nodes and 1350 edges.');
            disp(' ');
            disp('load stufe.mat;');
            disp(' ');
            load stufe.mat;
            W = Problem.A;
            coords = Problem.aux.coord;
        end
        if (nmesh==5)
            disp(' ');
            disp(' Structural graph with 5981 nodes and 4862 edges.');
            disp(' ');
            disp('load ukerbe1.mat');
            disp(' ');
            load ukerbe1.mat;
            W = Problem.A;
            coords = Problem.aux.coord;
        end
        
        disp(' ');
        disp('          *********************************************')
        disp('          ***        Various Bisection Methods      *** ');
        disp('          *********************************************')
        disp(' ');
        disp(' ');
        
        figure(1)
        disp('Plot the corresponding graph.');
        disp('  ');
        gplotg(W,coords);
        nvtx  = size(W,1);
        nedge = (nnz(W)-nvtx)/2;
        xlabel([int2str(nvtx) ' vertices, ' int2str(nedge) ' edges'],'visible','on');
        
        disp(' Hit space to continue ...');
        pause;
        
        disp(' 1. Coordinate bisection of a mesh returns a list of the vertices ');
        disp(' on one side of a partition obtained by bisection                 ');
        disp(' perpendicular to a coordinate axis.  We try every                ');
        disp(' coordinate axis and return the best cut. Input W is              ');
        disp(' the adjacency matrix of the mesh; each row of xy is              ');
        disp(' the coordinates of a point in d-space.                           ');
        
        figure(2)
        [p1,p2] = bisection_coordinate(W,coords,picture);
        [cut_coord] = cutsize(W,p1);
        disp('Space to continue ...');
        pause;
        
        figure(3)
        disp(' ');
        disp(' 2. A multilevel method from the "Metis 5.0.2" package.');
        disp(' This will only work if you have Metis and its Matlab interface.');
        disp('  ');
        [p1,p2] = bisection_metis(W,coords,picture);
        [cut_metis] = cutsize(W,p1);
        disp('  ');
        disp(' Hit space to continue ...');
        pause;
                
        disp(' ');
        disp(' 3. Spectral partitioning, which uses the second eigenvector of');
        disp(' the Laplacian matrix of the graph, also known as the "Fiedler vector".');
        disp('  ');
        figure(4)
        [p1,p2] = bisection_spectral(W,coords,picture);
        [cut_spectral] = cutsize(W,p1);
        disp('  ');
        disp(' Hit space to continue ...');
        pause;
        
        figure(5)
        disp(' ');
        disp(' 4. Inertial partitioning, which uses the coordinates to find');
        disp(' a separating line in the plane.');
        disp('  ');
        [p1,p2] = bisection_inertial(W,coords,picture);
        [cut_inertial] = cutsize(W,p1);
        disp('  ');
        disp(' Hit space to continue ...');
        pause;
        close all;
        
        format;
        
        disp(' ');
        disp('          ************************************************')
        disp('          ***            Bisection Benchmark           *** ');
        disp('          ***        D.P. & O.S. for HPC, USI Lugano   *** ');
        disp('          ************************************************')
        disp(' ');
        disp(' ');
        
        
    end