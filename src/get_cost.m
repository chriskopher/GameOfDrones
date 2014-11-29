function [weighted_cost,price,time] = get_cost(path,graph_m,...
    cost_m,time_m)
% This function calculates the total time and cost of the given path, and
% also returns the weighted cost for comparison with the Dijkstra
% algorithm.
    weighted_cost = 0;
    price = 0;
    time = 0;
    % Iterate through the path and calculate the values of price and time
    for i = 1:length(path)-1
        weighted_cost = weighted_cost + graph_m(path(i),path(i+1));
        if exist('cost_m','var')
            price = price + cost_m(path(i),path(i+1));
        end
        if exist('time_m','var')
            time = time + time_m(path(i),path(i+1));
        end
    end
end

