function graph_m = graph(files)
    %Constants
    DELIM = ',';
    class(files)
    % Read the CSV files with the graph information into a matrix
    % Format of names is: "node_num,node_name"
    % Format of edges is: "node1num,node2num,edge_type,edge_distance"
    % Format of weightings is: "edge_type,price_per_km,speed"
    names = read_mixed_csv(files{1},DELIM);
    fprintf('names ran\n');
    edges = read_mixed_csv(files{2},DELIM);
    fprintf('edges ran\n');
    weightings = read_mixed_csv(files{3},DELIM);
    fprintf('weightings ran\n');
    graph_m = 0;
end
