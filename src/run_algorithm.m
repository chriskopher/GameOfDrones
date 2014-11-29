function [path,weighted_cost,price,time] = run_algorithm(...
    graph_values_file,edge_type_file,price_weight,time_weight,...
    start_node,end_node)
% This function runs both the graph creation and the algorithm and returns
% everything required to compare with Dijkstra
    % Get the graph values
    [graph_m,cost_m,time_m] = graph(graph_values_file,...
        edge_type_file,price_weight,time_weight,true);
    % Calculate the path with the algorithm
    path = algorithm(graph_m,start_node,end_node);
    % Get the weighted cost, price and time of the path
    [weighted_cost,price,time] = get_cost(path,graph_m,cost_m,time_m);
end