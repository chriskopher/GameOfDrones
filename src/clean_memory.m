function cleaned_memory = clean_memory(memory_matrix)
% Function checks for repeated elements in the memory matrix. If one is 
% found it jumps over all the elements in between and continues to check 
% the rest of the matrix. Once the entire matrix has been checked, that 
% value it added to the end of a new "clean" matrix. 

    cleaned_memory = [];
    i = 1;
    while i<=length(memory_matrix)
        j=i+1;
        while j<=length(memory_matrix)
            % Are the two elements in memory matrix equal?
            if memory_matrix(i)==memory_matrix(j)
                i=j; % If yes, jump over all elements in between
                j=i+1; % Move j over to avoid infinite loop
            end     
            j=j+1; % Check next element 
        end
        % Add the element to new squeaky clean matrix
        cleaned_memory(end+1)=memory_matrix(i); 
        i=i+1;
    end
end
