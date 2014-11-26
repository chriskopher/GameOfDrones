function new_vector = check_visited(vector,memory_matrix)
% This function will check the memory matrix and set columns in the
% new_vector to -1 if they are present in the memory. As a result,
% new_vector will be the possible destinations for this iteration.

    new_vector = vector; %Preallocating for speed

    for i = 1:length(vector)
        for j = 1:length(memory_matrix)
            if vector(i) ~= -1 && memory_matrix(j) == i
               new_vector(i) = -1;
            end
        end
    end
end
