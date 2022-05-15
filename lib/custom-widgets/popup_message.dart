import 'package:flutter/material.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';
import 'package:senior_tech/tts-control.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    } else {
      children.add(GradButton(
          margin: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(15),
          onPressed: () => Navigator.pop(context),
          child: Text(AppLocalizations.of(context)!.back),
          gradient: const LinearGradient(
              colors: [Colors.red, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)));
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
