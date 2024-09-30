import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CElevatedButton extends StatelessWidget {
  const CElevatedButton(
      {super.key,
      required this.onPressed,
      this.padding,
      this.margin,
      required this.child,
      this.height = 48,
      this.radius = 24,
      this.width});
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget child;
  final double height;
  final double? width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: CSizes.md),
          child: child,
        ),
      ),
    );
  }
}
