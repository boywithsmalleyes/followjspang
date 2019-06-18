import 'package:flutter/material.dart';

import 'dragable_widget.dart';

class DraggableDemo extends StatelessWidget {
  Color _drawableColor = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Draggable Demo"),
      ),
      body: Stack(
        children: <Widget>[
          DraggableWidget(Offset(80, 80), Colors.blueGrey),
          DraggableWidget(Offset(180, 80), Colors.greenAccent),
          Center(
            child: DragTarget(
              onAccept: (Color color) {
                _drawableColor = color;
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 200,
                  height: 200,
                  color: _drawableColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
