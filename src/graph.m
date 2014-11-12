function graph_m = graph(file,header)
    if ~exist('header')
        header = false;
    else
        header = true;
    end
    % Read the CSV file with the graph information into a matrix
    % Format is: "node1name,node1num,edgecost,edgetime,node2name,node2num"
    if header
        data = csvread(file,2)
    else
        data = csvread(file)
    end

end
