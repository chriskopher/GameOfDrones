function node = backtrack(current_node,memory_matrix)
    if current_node == memory_matrix(1)
        node = memory_matrix(2);
    else
        for i = 1:size(memory_matrix)
          if i == current_node
            node = memory_matrix(i-1);
            break;
          end
        end
    end
end
