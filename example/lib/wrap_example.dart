import 'package:flutter/material.dart';

import 'package:reorderables/reorderables.dart';

class WrapExample extends StatefulWidget {
  @override
  _WrapExampleState createState() => _WrapExampleState();
}

class _WrapExampleState extends State<WrapExample> {
  final double _iconSize = 90;
  late List<Widget> _tiles;

  @override
  void initState() {
    super.initState();
    _tiles = <Widget>[
      // Icon(Icons.filter_1, size: _iconSize),
      // Icon(Icons.filter_2, size: _iconSize),
      // Icon(Icons.filter_3, size: _iconSize),
      // Icon(Icons.filter_4, size: _iconSize),
      // Icon(Icons.filter_5, size: _iconSize),
      // Icon(Icons.filter_6, size: _iconSize),
      // Icon(Icons.filter_7, size: _iconSize),
      // Icon(Icons.filter_8, size: _iconSize),
      // Icon(Icons.filter_9, size: _iconSize),

      Container(
        key: ValueKey('index1'),
        padding: EdgeInsets.all(8),
        color: Colors.blue[100],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.filter_1, size: _iconSize),
            SizedBox(width: 8),
            ReorderableDragStartListener(
              index: 1,
              child: Icon(Icons.drag_handle),
            ),
          ],
        ),
      ),
      Container(
        key: ValueKey('index2'),
        padding: EdgeInsets.all(8),
        color: Colors.blue[100],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.filter_2, size: _iconSize),
            SizedBox(width: 8),
            ReorderableDragStartListener(
              index: 2,
              child: Icon(Icons.drag_handle),
            ),
          ],
        ),
      ),
      Container(
        key: ValueKey('index3'),
        padding: EdgeInsets.all(8),
        color: Colors.blue[100],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.filter_3, size: _iconSize),
            SizedBox(width: 8),
            ReorderableDragStartListener(
              index: 3,
              child: Icon(Icons.drag_handle),
            ),
          ],
        ),
      ),
      Container(
        key: ValueKey('index4'),
        padding: EdgeInsets.all(8),
        color: Colors.blue[100],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.filter_4, size: _iconSize),
            SizedBox(width: 8),
            ReorderableDragStartListener(
              index: 4,
              child: Icon(Icons.drag_handle),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _tiles.removeAt(oldIndex);
        _tiles.insert(newIndex, row);
      });
    }

    var wrap = ReorderableWrap(
      spacing: 8.0,
      runSpacing: 4.0,
      padding: const EdgeInsets.all(8),
      children: _tiles,
      isCustomDragUI: true,
      onReorder: _onReorder,
      needsLongPressDraggable: false,
      onNoReorder: (int index) {
        //this callback is optional
        debugPrint('${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
      },
      onReorderStarted: (int index) {
        //this callback is optional
        debugPrint('${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
      }
    );

    return SingleChildScrollView(
      child: wrap,
    );

  }
}
