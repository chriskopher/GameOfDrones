function graph_m = graph(files)
    %Constants
    HEADER_SIZE = 1;
    
    % Read the CSV files with the graph information into a matrix
    % Format of names is: "node_num,node_name"
    % Format of edges is: "node1num,node2num,edge_type,edge_distance"
    % Format of weightings is: "edge_type,price_per_km,speed"
    names = csvread(files{1},HEADER_SIZE);
    edges = csvread(files{2},HEADER_SIZE);
    weightings = csvread(files{3},HEADER_SIZE);
end
