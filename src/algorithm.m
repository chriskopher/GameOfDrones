function [path, cost] = algorithm(graph,start_node,end_node)
% Initialize the global algorithm variables
    current_node = start_node;
    done = false;
    memory_matrix = [];
    
% Start looping until we've arrived at the end node
    while ~done
        % Add our current position to the memory.
        memory_matrix(end+1) = current_node;
       % Check to see if the end node is connected to the current node. If
       % it is, go there and finish.
       if graph(current_node,end_node) ~= -1
           memory_matrix(end+1) = end_node;
           done = true;
       % If the end node is not connected to the current node...
       else
           % Extract the current row of the matrix
           vector = graph(current_node,:);
           % Check memory matrix and set columns we've visited to -1
           vector = check_visited(vector,memory_matrix);
           % Find the node number with minimum edge weight
           lowest_node = scan(vector);
           % If the lowest edge weight is positive, we haven't visited all
           % nodes yet. Therefore...
           if lowest_node ~= -1
               % ...move to the lowest valued node.
               current_node = lowest_node;
           % If we've visited all nodes...
           else
               % ...find the last node we went to by searching memory,...
               last_node = backtrack(current_node, memory_matrix);
               % ...and go to the last node we were at.
               current_node = last_node;
           end
       end
    end
    % Clean the memory of all redundancies and return it as the path.
    path = clean_memory(memory_matrix);
    cost = get_cost(path,graph);
end