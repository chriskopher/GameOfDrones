function cleaned_memory = clean_memory(memory_matrix)
%Function checks for repeated elememt in the memory matrix, if one is found
%it jumps over all the elements inbetween and continues to check the rest
%of the matrix. Once then entire matrix has been checked, that value it
%added to the end of a new "clean" matrix. 

cleaned_memory = [];
i = 1;
while i<=length(memory_matrix)
    j=i+1;
    while j<=length(memory_matrix)
        %are the two elements in memory matrix equal?
        if memory_matrix(i)==memory_matrix(j)
            i=j; %if yes, jump over all elements in between
            j=i+1; %move j over to avoid infinite loop
        end     
        j=j+1; %check next element 
    end
cleaned_memory(end+1)=memory_matrix(i); 
%add the element to new squeaky clean matrix
i=i+1;
end
