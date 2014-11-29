%%Testing.m
% This is the main script to run the testing of the files.
% We will start by testing the graph creation:
PRICE_WEIGHT = 1;
TIME_WEIGHT = 0;
NODE1 = 7;
NODE2 = 8;
addpath ./src

%Define the files to read in order
names = 'data/california_names.csv';
graph_values = 'data/california.csv';
edge_types = 'data/edge_types.csv';

%Run the graph function
[graph_m,cost_m,time_m] = graph(graph_values,edge_types,PRICE_WEIGHT,TIME_WEIGHT,true);
[path,cost,price,time] = run_algorithm(graph_values,edge_types,...
    PRICE_WEIGHT,TIME_WEIGHT,NODE1,NODE2);
[D,D_path] = dijkstra(graph_m, [NODE1,NODE2]);
[D_cost,D_price,D_time] = get_cost(D_path,graph_m,cost_m,time_m);

fprintf('\nThe calculated path with our algorithm is:');
path
fprintf('Path_Cost: %.2f || Price: $%.2f || Time: %.2f h\n',cost,...
    price,time);
fprintf('\nThe Dijkstra path is:');
D_path
fprintf('D_Cost: %.2f || D_Price: $%.2f || D_Time: %.2f h\n',D_cost,...
    D_price,D_time);

fprintf('\nThe difference in size between D_path and path is %d.\n',...
    length(path)-length(D_path));
if isequal(path, D_path)
    fprintf('The paths are the same!\n');
else
    fprintf('The paths are NOT the same :(\n');
    if D_cost < cost
        fprintf('Weighted Cost is %.2f (%.4f times) more expensive.\n',...
            cost-D_cost,cost/D_cost);
    else
        fprintf('The outputted path has LOWER cost than Dijkstra?!!!\n');
        cost
        D_cost
    end
end
rmpath ./src