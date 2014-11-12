function graph_m = graph(file)
    % Read the CSV file with the graph information into a matrix
    % Format is: "node1name,node1num,edgecost,edgetime,node2name,node2num"
    data = csvread(file);

end
