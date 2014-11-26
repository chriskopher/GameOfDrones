function column = scan(vector)
% Function that scans for the lowest value in a horizontal vector that is
% positive, and returns the column number of that value.
    % Check if the given vector is a 1xn matrix.
    if size(vector,1) > 1
        throw(MException('SCAN:BadSize','Vector has too many rows.'));
    end
    
    % Set all negative values to infinity, as we want to ignore them when we
    % run the min function
    vector(vector<0) = Inf;
    
    % Get the minimum value and set column to the column location.
    [minval, column] = min(vector);
    if minval == Inf
        column = -1;
    end
end