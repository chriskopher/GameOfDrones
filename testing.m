%%Testing.m
% This is the main script to run the testing of the files.
% We will start by testing the graph creation:

addpath ./src

%Define the files to read in order
names = 'data/california_names.csv';
edges = 'data/california.csv';
weightings = 'data/edge_types.csv';
    % Put the files in a cell
files = {names edges weightings};

%Run the graph function
graph(files,true);

rmpath ./src