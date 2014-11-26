function matrix = cellstr2num(cell,column)
    matrix = cell;
    % Calculate the size of the cell
    [cell_rows cell_columns] = size(matrix);
    
    % Loop through the cell column and change the elements
    for i = 1:cell_rows
        for j = column(1):column(end)
            val = str2double(cell2mat(matrix(i,j)));
            % Change the value only if it is not NaN
            if ~isnan(val)
                matrix(i,j) = num2cell(val);
            end
        end
    end
end