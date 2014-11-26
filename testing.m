%%Testing.m
% This is the main script to run the testing of the files.
% We will start by testing the graph creation:

addpath ./src

%Define the files to read in order
names = 'data/california_names.csv';
edges = 'data/test_graph.csv';
weightings = 'data/test_edges.csv';

%Run the graph function
graph_m = graph(edges,weightings,50,50,true);

rmpath ./src