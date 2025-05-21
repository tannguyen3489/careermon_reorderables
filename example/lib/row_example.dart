import 'package:flutter/material.dart';

import 'package:reorderables/reorderables.dart';

class RowExample extends StatefulWidget {
  @override
  _RowExampleState createState() => _RowExampleState();
}

class _RowExampleState extends State<RowExample> {
  late List<Widget> _columns;

  @override
  void initState() {
    super.initState();
    _columns = <Widget>[
      Container(
        key: ValueKey('assets/river1.jpg'),
        padding: EdgeInsets.all(8),
        color: Colors.blue[100],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('assets/river1.jpg'),
            SizedBox(width: 8),
            ReorderableDragStartListener(
              index: 1,
              child: Icon(Icons.drag_handle),
            ),
          ],
        ),
      ),
      Container(
        key: ValueKey('assets/river2.jpg'),
        padding: EdgeInsets.all(8),
        color: Colors.blue[100],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('assets/river2.jpg'),
            SizedBox(width: 8),
            ReorderableDragStartListener(
              index: 2,
              child: Icon(Icons.drag_handle),
            ),
          ],
        ),
      ),
      Container(
        key: ValueKey('assets/river3.jpg'),
        padding: EdgeInsets.all(8),
        color: Colors.blue[100],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('assets/river3.jpg'),
            SizedBox(width: 8),
            ReorderableDragStartListener(
              index: 3,
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
        Widget col = _columns.removeAt(oldIndex);
        _columns.insert(newIndex, col);
      });
    }

    return ReorderableWrap(
      // crossAxisAlignment: CrossAxisAlignment.start,
      padding: EdgeInsets.all(8),
      children: _columns,
      onReorder: _onReorder,

      onNoReorder: (int index) {
        //this callback is optional
        debugPrint('${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
      },
    );
  }
}
