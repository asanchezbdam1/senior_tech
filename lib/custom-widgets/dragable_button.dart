import 'package:flutter/material.dart';

class DraggableButton extends StatefulWidget {
  final List<Widget> children;
  final Offset initialOffset;
  final VoidCallback onPressed;
  final VoidCallback onDragged;

  const DraggableButton(
      {Key? key,
      required this.initialOffset,
      required this.onPressed,
      required this.children,
      required this.onDragged})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton> {
  late Widget _child;
  int _index = 0;
  Offset _offset = const Offset(40, 40);

  void changeChildState() {
    setState(() {
      _index = ++_index % widget.children.length;
      //_child = widget.children[_index];
    });
  }

  @override
  Widget build(BuildContext context) {
    _child = widget.children[_index];
    return Positioned(
        top: _offset.dy,
        left: _offset.dx,
        height: 65,
        width: 65,
        child: GestureDetector(
          onPanUpdate: (details) {
            _offset += details.delta;
            widget.onDragged();
          },
          child: FloatingActionButton(
              onPressed: () {
                changeChildState();
                widget.onPressed();
              },
              child: _child),
        ));
  }
}
