function graph_m = graph(graph_file,edge_type_file,price_weight,time_weight,DEBUG)
%% File setup
% Reads files and prepares initial variables and matrices.
    % Initialization of variables if not passed as arguments.
    if ~exist('DEBUG','var')
        DEBUG = false;
    end
    if ~exist('price_weight','var')
        price_weight = 1;
    end
    if ~exist('time_weight','var')
        time_weight = 1;
    end
    
    %Constants
    DELIM = ',';
    HEADERS = 1;
    
    % Read the CSV files with the graph information into a matrix
    % Format of graph_values is: "node1num,node2num,edge_type,edge_distance"
    % Format of edge_types is: "edge_type,price_per_km,speed"
    graph_values = read_mixed_csv(graph_file,DELIM);
    graph_values = graph_values((HEADERS+1):end,:);
    graph_values = cellstr2num(graph_values,[1 2 4]);
    if DEBUG
        fprintf('edges file read correctly.\n');
    end
    edge_types = read_mixed_csv(edge_type_file,DELIM);
    edge_types = edge_types((HEADERS+1):end,:);
    edge_types = cellstr2num(edge_types,2:3);
    if DEBUG
        fprintf('weightings file read correctly.\n');
    end
    
%% Creation of graph
    % Set graph_m to an nxn matrix of -1's to do work on it.
    n = max(cell2mat(graph_values(:,2)));
    graph_m = -1 .* ones(n);
    if DEBUG
        fprintf('\nSet graph_m to a %dx%d matrix\n',n,n);
    end
    
    % Iterate through the edges matrix and assign the price and time values
    for i = 1:length(graph_values)
        % Holds the values of the weightings type associated with this row

        type_vector = edge_types(find(strcmp(cell2mat(graph_values(i,3)), ...
            edge_types)),:);
        % Set the values of the edges array based on the distances
        graph_values{i,5} = graph_values{i,4} * type_vector{1,2};
        graph_values{i,6} = graph_values{i,4} * type_vector{1,3};
    end
    if DEBUG
        fprintf('\nThis is edges after adding price and time columns:');
        graph_values
    end
    
    % Go through graph_m and start setting the values as the lowest
    % weighted average.
    for k = 1:size(graph_values,1)
        % These are the locations of the element in graph_m we are setting,
        % as defined by the edges.
        i = cell2mat(graph_values(k,1));
        j = cell2mat(graph_values(k,2));
        
        % Perform weighted averaging on the price and time costs of the
        % edge.
        weighted_val = weighted_avg(price_weight, cell2mat(graph_values(k,5)), ...
             time_weight, cell2mat(graph_values(k,6)));

        % If the weighted average is less than the current value at graph_m
        % or that element has not been set, make graph_m at the element the
        % value of the weighted average. This will let us run the algorithm
        % on only one weighting instead of many.
        if weighted_val < graph_m(i,j)|| graph_m(i,j) == -1
           if DEBUG
               fprintf('Setting graph at (%d,%d) and (%d,%d) to %d\n',i,...
                   j,j,i,weighted_val);
           end
           graph_m(i,j) = weighted_val;
           graph_m(j,i) = weighted_val;
        end
    end
end
