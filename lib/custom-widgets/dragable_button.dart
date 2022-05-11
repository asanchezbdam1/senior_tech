import 'package:flutter/material.dart';
import 'package:senior_tech/tts-control.dart';

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

  void changeState() =>
      setState(() => _index = ++_index % widget.children.length);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _child = widget.children[_index];
    TTSControl.onStop = changeState;
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
                changeState();
                widget.onPressed();
              },
              child: _child),
        ));
  }
}
