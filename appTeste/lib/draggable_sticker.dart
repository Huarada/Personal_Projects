import 'package:flutter/material.dart';

class DraggableSticker extends StatefulWidget {
  final Offset initialPosition;
  final Widget child;
  final Function(Offset position) onDragEnd;

  DraggableSticker({required this.initialPosition, required this.child, required this.onDragEnd});

  @override
  _DraggableStickerState createState() => _DraggableStickerState();
}

class _DraggableStickerState extends State<DraggableSticker> {
  late Offset position;

  @override
  void initState() {
    super.initState();
    position = widget.initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            position = Offset(
              position.dx + details.delta.dx,
              position.dy + details.delta.dy,
            );
          });
        },
        onPanEnd: (details) {
          widget.onDragEnd(position);
        },
        child: widget.child,
      ),
    );
  }
}