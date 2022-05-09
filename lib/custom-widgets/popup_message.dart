import 'package:flutter/material.dart';
import 'package:senior_tech/tts-control.dart';

class PopupMessage extends StatelessWidget {
  final String? title;
  final String message;
  final Color? fontColor;
  final Widget? button;
  final EdgeInsets? padding;
  const PopupMessage({
    Key? key,
    required this.message,
    this.title,
    this.button,
    this.fontColor,
    this.padding = const EdgeInsets.all(20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = List<Widget>.filled(1, Text(message), growable: true);
    if (button != null) {
      children.add(button!);
    }
    Text? titlewidget = null;
    if (title != null) {
      titlewidget = Text(title!);
    }
    TTSControl.setText(message);
    return SimpleDialog(
      title: titlewidget,
      contentPadding: padding!,
      children: children,
    );
  }
}
