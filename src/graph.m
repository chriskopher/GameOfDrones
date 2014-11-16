function graph_m = graph(files,DEBUG)
    if ~exist('DEBUG','var')
        DEBUG = false;
    end
    %Constants
    DELIM = ',';
    HEADERS = 1;
    
    % Read the CSV files with the graph information into a matrix
    % Format of names is: "node_num,node_name"
    % Format of edges is: "node1num,node2num,edge_type,edge_distance"
    % Format of weightings is: "edge_type,price_per_km,speed"
    names = read_mixed_csv(files{1},DELIM);
    names = names((HEADERS+1):end,:)
    if DEBUG
        fprintf('names ran:\n');
    end
    edges = read_mixed_csv(files{2},DELIM);
    edges = edges((HEADERS+1):end,:)
    if DEBUG
        fprintf('edges ran\n');
    end
    weightings = read_mixed_csv(files{3},DELIM);
    weightings = weightings((HEADERS+1):end,:)
    if DEBUG
        fprintf('weightings ran\n');
    end
    graph_m = 0;
end
