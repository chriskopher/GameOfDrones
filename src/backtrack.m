function node = backtrack(current_node,memory_matrix)
% This function finds the first instance of current_node in the
% memory_matrix of the algorithm, and returns the node before that so
% we can go to it.

    % Set node to -1 by default, in case of errors.
    node = -1;
    
    % If the current node is the initial node, we'll get an out-of-range
    % error when reading for a previous value. We have to go to the second
    % element in the memory matrix.
    if current_node == memory_matrix(1)
        node = memory_matrix(2);
    else
        % Start checking the values of memory_matrix
        for i = 2:length(memory_matrix)
            if memory_matrix(i) == current_node
                % We have to go to the node before the first time we went
                % to current_node.
                node = memory_matrix(i-1);
                % Exit so we don't replace the node we want to go to if
                % there's another current_node in the memory_matrix
                break;
            end
        end
    end
end
