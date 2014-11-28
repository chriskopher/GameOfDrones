function [D, path] = dijkstra(G, nodes)
    % This function takes an adjacency matrix called G and a 1-by-2 matrix
    % called nodes. The nodes matrix will take in the starting and final
    % nodes respectively.
    %
    % The function will return the shortest distance between the given
    % nodes and output the path of nodes taken.
 
    v = size(G, 1); 	 % Number of vertices
    D = [];
    path = [];
    temp = [];

 
    %Making matrix full of the edge weight's and Inf's if not connected
    for i = 1:v
        for j = 1:v
            if G(i,j) <= 0
                G(i,j) = inf;
            end
        end
    end
 
    dist = inf(1, v);   %setting distances to be infinite
    seen = ones(1, v);  %setting seen to be all ones
    not_seen = v;       %making all nodes not yet seen

    dist(1, nodes(1,1)) = 0;    %setting the initial node distance to 0

    while not_seen > 0
        [distance, index] = min(dist .* seen);   %initializes distance as 0, index as 1. records previous distance, and index is the node it is checking

        if distance == inf                      %if all distances are inf, aka no connections left, break loop
            break;
        end

        if index == nodes(1,2)                  %if the endpoint is connected, break loop
            break;
        end

        seen(index) = inf;                      %marking the current node as seen/visited
        not_seen = not_seen - 1;                %lowering the count of unseen nodes by 1

        for n = 1:v                             %check the current node to see if connected to other nodes
            if seen(n) == 1                     %if node is connected to others, seen(n) will be 1, not Inf
                alt = distance + G(index, n);   %calculate a tentative distance from current node, to next connected node
                if alt < dist(n)                %if this tentative distance is less than the currently assigned value, make it the new one
                    dist(n) = alt;
                    temp(n) = index;            %will be used to recover path taken
                end
            end
        end
    end
    D = [D ; dist(nodes(1,2))];                 %record the total distance travelled

    %% Finding the path taken by dijkstra
    target = nodes(1,2);
    final = nodes(1,1);

    while target ~= final
        target = temp(target);           % 4      -- tell you what the next node to go is (reverse order)
        path = [target path];            % add the target node to the path
    end
    path = [path nodes(1,2)];            % add the final node to the path
end
