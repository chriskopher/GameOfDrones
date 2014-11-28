function cost = get_cost(path,graph_m)
    cost = 0;
    for i = 1:length(path)-1
        cost = cost + graph_m(path(i),path(i+1));
    end
end

