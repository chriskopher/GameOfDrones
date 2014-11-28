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
graph_m = graph(graph_values,edge_types,PRICE_WEIGHT,TIME_WEIGHT,true);
[path cost] = algorithm(graph_m,NODE1,NODE2);
[D_cost D_path] = dijkstra(graph_m, [NODE1,NODE2]);

fprintf('\nThe difference in size between D_path and path is %d.\n',...
    length(path)-length(D_path));
if isequal(path, D_path)
    fprintf('The paths are the same!\n');
    path
    fprintf('The cost is $%.2f.\n',cost);
else
    fprintf('The paths are NOT the same :(\n');
    path
    D_path
    if D_cost < cost
        fprintf('Path is $%.2f (%.4f times) more expensive.\n',...
            cost-D_cost,cost/D_cost);
        fprintf('Path_Cost: $%.2f || D_Cost: $%.2f.\n',cost,D_cost);
    else
        fprintf('The outputted path has LOWER cost than Dijkstra?!!!\n');
        cost
        D_cost
    end
end
rmpath ./src