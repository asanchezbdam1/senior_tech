import 'package:flutter/material.dart';
import 'package:senior_tech/custom-widgets/dragable_button.dart';
import 'package:senior_tech/tts-control.dart';

DraggableButton getControlButton(VoidCallback onDragged) {
  var draggable = DraggableButton(
      initialOffset: const Offset(50, 50),
      onPressed: TTSControl.changeState,
      children: const [
        Icon(Icons.play_arrow, size: 50),
        Icon(Icons.pause, size: 50)
      ],
      onDragged: onDragged);
  return draggable;
}
