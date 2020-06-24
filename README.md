# Credit
The code is translated from python based on the following tutorial:<br />
https://www.youtube.com/watch?v=Ub4-nG09PFw<br />
The original python code can be found here:<br />
https://gist.github.com/amitabhadey/37af83a84d8c372a9f02372e6d5f6732<br />
Please give credit to the origin of this code by wathcing his great tutorial.

# Dijkstra's algorith
Dijkstra's algorithm written in Dart for use in flutter applications for example.
The algorithm is a very popular "shortest path" algorithm that can find the shortest distance from node "x" to node "y" in a weighted graph.

## How to use it
The algorithm is written as its own function that takes three arguments:
```Dart
List<String> dijkstra(graph, start, end){...}
```
In the main.dart there is already defined a graph which you can try the algorithm on yourself. You only need to include this graph together with a start and endpoint as arguments for the function.
