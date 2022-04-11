import 'package:flutter/material.dart';

class GradButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const GradButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}

class ExpandableContainer extends StatefulWidget {
  final Widget title;
  final Gradient? gradient;
  final Color? backgroundColor;
  final Color? collapsedBackgroundColor;
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
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
            children: [widget.child],
          )),
    );
  }
}
