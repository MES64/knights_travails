# Knights Travails

This project contains a method knight_moves which outputs the shortest path between two squares on a chess board.

The rules for moving a knight and the limits of the chess board apply.

This problem can be viewed as a graph problem, with squares being vertexes and moves being edges.

This implementation uses BFS since BFS naturally checks shortest to longest paths in order. Nodes are only ever visited once, so if they have already been visited then there is no point in looking at them for the shortest path.

It keeps track of visited squares (vertexes) in a hash, with the values equalling the previous square traveled from. Essentially, this hash contains all the moves (edges) incident on an edge.

This hash allows the program to reconstruct the shortest path at the end without having to store the full path in an array and put in the BFS queue for example, saving memory from O(n*log(n)) to O(n) space. Time should also be O(n) for visiting potentially every node.

From The Odin Project: https://www.theodinproject.com/lessons/ruby-knights-travails