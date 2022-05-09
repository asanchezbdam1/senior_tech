import 'package:flutter/material.dart';
import 'package:senior_tech/tts-control.dart';

class ExpandableContainer extends StatefulWidget {
  final Widget title;
  final Gradient? gradient;
  final Color? backgroundColor;
  final Color? collapsedBackgroundColor;
  final Color? childBackgroundColor;
  final Color? titleColor;
  final String? message;
  final double? radius;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingRight;
  final double? paddingLeft;
  final EdgeInsetsGeometry? margin;
  final Widget child;

  const ExpandableContainer({
    Key? key,
    required this.title,
    required this.child,
    this.message,
    this.radius,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.gradient,
    this.paddingTop,
    this.paddingBottom,
    this.paddingRight,
    this.paddingLeft,
    this.margin,
    this.titleColor,
    this.childBackgroundColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  @override
  Widget build(BuildContext context) {
    Widget childitem = widget.child;
    if (widget.childBackgroundColor != null) {
      childitem = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius ?? 0),
              color: widget.childBackgroundColor,
            ),
            child: widget.child,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
          )
        ],
      );
    }
    return Card(
      margin: widget.margin ?? const EdgeInsets.all(10),
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(
          left: widget.paddingLeft ?? 0,
          top: widget.paddingTop ?? 0,
          right: widget.paddingRight ?? 0,
          bottom: widget.paddingBottom ?? 0,
        ),
        decoration: BoxDecoration(
          gradient: widget.gradient,
          borderRadius: BorderRadius.circular(widget.radius ?? 0),
        ),
        child: ExpansionTile(
          title: widget.title,
          backgroundColor: widget.backgroundColor ?? Colors.transparent,
          collapsedBackgroundColor:
              widget.collapsedBackgroundColor ?? Colors.transparent,
          children: [childitem],
          collapsedIconColor: widget.titleColor ?? Colors.white,
          iconColor: widget.titleColor ?? Colors.white,
          collapsedTextColor: widget.titleColor ?? Colors.white,
          textColor: widget.titleColor ?? Colors.white,
          onExpansionChanged: (expanding) {
            if (expanding && widget.message != null) {
              TTSControl.setText(widget.message!);
            }
          },
        ),
      ),
    );
  }
}
