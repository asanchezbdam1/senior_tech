import 'package:flutter/material.dart';

class ExpandableContainer extends StatefulWidget {
  final Widget title;
  final Gradient? gradient;
  final Color? backgroundColor;
  final Color? collapsedBackgroundColor;
  final Color? childBackgroundColor;
  final Color? titleColor;
  final double? radius;
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;
  final Widget child;

  const ExpandableContainer({
    Key? key,
    required this.title,
    required this.child,
    this.radius,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.gradient,
    this.top,
    this.bottom,
    this.right,
    this.left,
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
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(
          left: widget.left ?? 0,
          top: widget.top ?? 0,
          right: widget.right ?? 0,
          bottom: widget.bottom ?? 0,
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
        ),
      ),
    );
  }
}
