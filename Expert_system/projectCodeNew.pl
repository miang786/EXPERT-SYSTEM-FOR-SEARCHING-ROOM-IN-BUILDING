%FLOOR 1 RIGHT SIDE OF XC
adjacent(stationaryshop, xc1, floor1, right).
adjacent(xc1, xc2, floor1, right).
adjacent(xc2, xc3, floor1, right).
adjacent(xc3, xc4, floor1, right).
adjacent(xc4, sAcs, floor1, right).
adjacent(sAcs, sAEEE, floor1, right).
adjacent(sAEEE, lobby, floor1, right).
adjacent(lobby, xc5, floor1, right).
adjacent(xc5, xc6, floor1, right).
adjacent(xc6, xc7, floor1, right).
adjacent(xc7, xc8, floor1, right).
adjacent(xc8, electricLab, floor1, right).

%FLOOR 1 LEFT SIDE OF XC
adjacent(hodcs, hodMedia, floor1, left).
adjacent(hodMedia, hodEEE, floor1, left).
adjacent(hodEEE, ladiesWR, floor1, left).
adjacent(ladiesWR, adminoffice, floor1, left).
adjacent(adminoffice, stairs, floor1, left).
adjacent(stairs, girlscommonroom, floor1, left).
adjacent(girlscommonroom, gentsWR, floor1, left).
adjacent(gentsWR, stairs, floor1, left).
adjacent(stairs, facultyroom, floor1, left).

%FLOOR 2 RIGHT SIDE OF XC
adjacent(xc9, xc10, floor2, right).
adjacent(xc10, xc11, floor2, right).
adjacent(xc11, xc12, floor2, right).
adjacent(xc12, xc13, floor2, right).
adjacent(xc13, lawcourtroom, floor2, right).
adjacent(lawcourtroom, computeroffice, floor2, right).
adjacent(computeroffice, xc15, floor2, right).
adjacent(xc15, xc16, floor2, right).
adjacent(xc16, xc17, floor2, right).
adjacent(xc17, xc18, floor2, right).
adjacent(xc18, lawLibrary, floor2, right).

%FLOOR 2 LEFT SIDE OF XC
adjacent(hodlaw, facultyroom1, floor2, left).
adjacent(facultyroom1, facultyoflaw, floor2, left).
adjacent(facultyoflaw, sAlaw, floor2, left).
adjacent(sAlaw, stairs, floor2, left).
adjacent(stairs, ladiesWR, floor2, left).
adjacent(ladiesWR, facultyoff, floor2, left).
adjacent(facultyoff, gentsWR, floor2, left).
adjacent(gentsWR, stairs, floor2, left).
adjacent(stairs, facultyroom2, floor2, left).

%FLOOR 3 RIGHT SIDE OF XC
adjacent(xc19, xc20, floor3, right).
adjacent(xc20, xc21, floor3, right).
adjacent(xc21, xc22, floor3, right).
adjacent(xc22, xc23, floor3, right).
adjacent(xc23, xc24, floor3, right).
adjacent(xc24, xc25, floor3, right).
adjacent(xc25, xc26, floor3, right).
adjacent(xc26, xc27, floor3, right).
adjacent(xc27, xc28, floor3, right).
adjacent(xc28, xc29, floor3, right).
adjacent(xc29, xclab, floor3, right).

%FLOOR 3 LEFT SIDE OF XC
adjacent(mediahouse, newsroom, floor3, left).
adjacent(newsroom, eslab, floor3, left).
adjacent(eslab, stairs, floor3, left).
adjacent(stairs, ladiesWR, floor3, left).
adjacent(ladiesWR, gentsWR, floor3, left).
adjacent(gentsWR, stairs, floor3, left).
adjacent(stairs, cctvroom, floor3, left).
adjacent(cctvroom, itroom, floor3, left).
adjacent(itroom, cslab, floor3, left).

%DEFINING RULES
%RULE FOR GETTING THE ROOM INFORMTION
whereis(Room):- adjacent(Room, Droom, Fl, Adj), write(Room), write(" IS ADJACENT TO "), write(Droom), write(" ON THE "), write(Adj), write(" SIDE OF THE "), write(Fl).

%RULE FOR IF THE ROOM EXISTS ON THE GIVEN FLOOR
exist(X, Floor):- adjacent(X, _, Floor, _), write(X), write(" EXISTS ON THE "), write(Floor); adjacent(_, X, Floor, _), write(X), write(" EXISTS ON THE "), write(Floor).

%RULE FOR GETTING THE PATH FROM ONE ROOM TO ANOTHER
pathfrom(X,Y,[X,Y]):- adjacent(X,Y,_,_).
pathfrom(X,Y,[X|Xs]):- adjacent(X,W,_,_), pathfrom(W,Y,Xs).

%RULE FOR GETTING INFORMATION ABOUT THE CONNECTED ROOMS
connected(X, Y, F, [X, Y]) :- adjacent(X, Y, F, _), write("ROOMS ARE CONNECTED AT "), write(F), write(" ALONG PATH").
connected(X, Y, F, [X|Xs]) :- adjacent(X, W, F, _), connected(W, Y, F, Xs).

%RULE FOR DEFINING DEPTH FIRST SEARCH
dfs(Goal,Goal,[Goal]) :- write("PATH RECIEVED FROM DFS").
dfs(Node,Goal,[Node|Path]) :- adjacent(Node,NewNode,_,_), dfs(NewNode,Goal,Path).