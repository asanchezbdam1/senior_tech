import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupMessage extends StatelessWidget {
  final String message;
  const PopupMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog();
  }
}
