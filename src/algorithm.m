function [path, total_weight] = algorithm(graph,start_node,end_node)
% Initialize the global algorithm variables
    current_node = start_node;
    done = false;
    memory_matrix = [start_node];
    total_weight = 0;
    
% Start looping until we've arrived at the end node
    while ~done
       % Check to see if the end node is connected to the current node. If
       % it is, go there and finish.
       if graph(current_node,end_node) ~= -1
           memory_matrix(1,end) = end_node;
           done = true;
       % If the end node is not connected to the current node...
       else
           
       end
    end
    clean_matrix(memory_matrix);
    path = memory_matrix;
end