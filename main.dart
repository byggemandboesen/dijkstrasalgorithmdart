Map<String, Map<String, int>> graph_nodes = {
  'A': {'B': 5, 'H': 4},
  'B': {'A': 5, 'C': 2},
  'C': {'B': 2, 'D': 3},
  'D': {'C': 3, 'E': 3, 'G': 1},
  'E': {'D': 3, 'F': 3},
  'F': {'E': 3, 'G': 4},
  'G': {'F': 4, 'D': 1},
  'H': {'A': 4, 'G': 1}
};

List<String> rooms = graph_nodes.keys.toList();

List<String> track_path = [];
int distance = 0;

// Returns shortest route as list. Takes graph, start- and endpoint as arguments.
List<String> dijkstra(graph, start, end){

  Map<String, int> shortest_distance = {}; //dictionary to record the cost to reach to node. We will constantly update this dictionary as we move along the graph.
  Map<String, String> track_predecessor = {}; //dictionary to keep track of path that led to that node.
  Map<String, Map<String, int>> unseenNodes = graph; //to iterate through all nodes
  int infinity = 5000; //infinity can be considered a very large number
  List<String> track_path = []; //List to record as we trace back our journey


  // =============================================================================
  // Initially we want to assign 0 as the cost to reach to source node and infinity as cost to all other nodes
  // =============================================================================
  unseenNodes.forEach((key, value) {
    shortest_distance[key] = infinity;
  });

  shortest_distance[start] = 0;


  // =============================================================================
  // The loop will keep running until we have entirely exhausted the graph, until we have seen all the nodes
  // =============================================================================
  // =============================================================================
  // To iterate through the graph, we need to determine the min_distance_node every time.
  // =============================================================================

  while(unseenNodes.isNotEmpty){
    String min_distance_node = null;

    unseenNodes.forEach((node, weight) {
      if (min_distance_node == null){
        min_distance_node = node;
      }
      else if(shortest_distance[node] < shortest_distance[min_distance_node]){
        min_distance_node = node;
      }
    });

    Map<String, int> path_options = graph[min_distance_node];

    path_options.forEach((child_node, weight) {
      if (weight + shortest_distance[min_distance_node] < shortest_distance[child_node]){
        shortest_distance[child_node] = weight + shortest_distance[min_distance_node];
        track_predecessor[child_node] = min_distance_node;
      }
    });
    unseenNodes.remove(min_distance_node);
  }

  String currentNode = end;

  while (currentNode != start){
    try{
      track_path.insert(0, currentNode);
      currentNode = track_predecessor[currentNode];
    }
    catch(keyError){
      print('Path not reachable');
      break;
    }
  }
  track_path.insert(0, start);

  if (shortest_distance[end] != infinity){
    print('Shortest distance is ' + shortest_distance[end].toString());
    print('And the path is ' + track_path.toString());
  }
  return track_path;
}
