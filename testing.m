%%Testing.m
% This is the main script to run the testing of the files.
% We will start by testing the graph creation:

addpath ./src

%Define the files to read in order
names = 'data/california_names.csv';
edges = 'data/california.csv';
weightings = 'data/edge_types.csv';

%Run the graph function
graph_m2 = graph(edges,weightings,50,50,true);

rmpath ./src