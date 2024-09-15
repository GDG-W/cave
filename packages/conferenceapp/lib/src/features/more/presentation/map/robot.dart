import 'package:devfest24/src/features/more/presentation/map/grid.dart';

import 'action.dart';

final class MapRobot {
  late Grid<int> _grid;

  final foundActions = <Action>[];
  bool aStartExecution = false;

  Map<Node, Node?> cameFrom = {};
  Map<String, Action?> actionMap = {};

  MapRobot(Grid<int> grid) {
    _grid = grid;
  }

  Action getAction(GridCell start, GridCell goal) {
    // execute only once to figure out the optimal path.
    if (!aStartExecution) {
      actionMap.putIfAbsent('above', () => Action.moveUp);
      actionMap.putIfAbsent('below', () => Action.moveDown);
      actionMap.putIfAbsent('left', () => Action.moveLeft);
      actionMap.putIfAbsent('right', () => Action.moveRight);
      actionMap.putIfAbsent('', () => Action.doNothing);
      _aStar(start, goal);
      aStartExecution = true;
    } else if (foundActions.isNotEmpty) {
      return foundActions.removeLast();
    }

    return Action.doNothing;
  }

  void _aStar(GridCell start, GridCell goal) {
    if (start == goal) {
      foundActions.add(Action.doNothing);
    }

    List<Node> openList = [];

    final startNode = Node(start, 0, '');

    openList.add(startNode);

    Map<GridCell, int> closeList = {};

    cameFrom.putIfAbsent(startNode, () => null);

    closeList.putIfAbsent(start, () => 0);

    while (openList.isNotEmpty) {
      openList.sort(); // sort list to get the node with the lowest priority
      final currentNode = openList.removeAt(0);

      if (currentNode.position == goal) {
        reconstructPath(currentNode);
        break;
      }

      Map<String, GridCell?> neighbouringPositions =
          _grid.getNeighbourPositions(currentNode.position);

      // traverse through the neighbouring four positions
      for (final neighbourEntry in neighbouringPositions.entries) {
        // Calculating the cost for the path from the starting point to the current
        // position's neighbour node
        final newCost = closeList[currentNode.position]! + 1;

        // extract the position
        final nextPosition = neighbourEntry.value;

        // the positioned picked up is not boundary and the position is not impassable
        // and the position was never visited
        if (nextPosition != null &&
            _grid.filter(nextPosition, (state) => state > 0) &&
            !closeList.containsKey(nextPosition)) {
          // add the position in the visited bucket;
          closeList.putIfAbsent(nextPosition, () => newCost);

          // calculating the total cost which is f(n) = g(n) + h(n)
          final priority =
              newCost + _manhattanDistanceHeuristic(nextPosition, goal);

          // create the node object which would contain the new position, the total cost
          // and the direction involved
          final neighbourNode =
              Node(nextPosition, priority, neighbourEntry.key);

          // add the node into the open list so it will sit in the priority queue
          openList.add(neighbourNode);

          // add the node into the visited nodes bucket - to track the direction
          cameFrom.putIfAbsent(neighbourNode, () => currentNode);
        }
      }
    }
  }

  void reconstructPath(Node target) {
    if (actionMap[target.tileName] != null) {
      foundActions.add(actionMap[target.tileName]!);
    }
    while (cameFrom[target] != null) {
      target = cameFrom[target]!;
      foundActions.add(actionMap[target.tileName]!);
    }

    if (foundActions.isNotEmpty) {
      foundActions.removeLast();
    }
  }

  int _manhattanDistanceHeuristic(GridCell a, GridCell b) {
    return (a.row - b.row).abs() + (a.column - b.column).abs();
  }
}

class Node implements Comparable<Node> {
  final GridCell position;
  final int priority;
  final String tileName;

  Node(this.position, this.priority, this.tileName);

  @override
  int compareTo(Node other) {
    return priority.compareTo(other.priority);
  }

  @override
  String toString() {
    return 'Node(${position.row}, ${position.column})';
  }
}
