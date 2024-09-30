import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';

class CCircularContainer extends StatelessWidget {
  const CCircularContainer(
      {super.key,
      this.height = 100,
      this.width = 100,
      this.color = CColors.softGrey,
      this.child,
      this.enableBorder = false,
      this.radius = 50,
      this.padding,
      this.margin,
      this.onTap,
      this.shadow,
      this.borderColor = CColors.primary,
      this.borderWidth = 1});
  final double? height;
  final double width;
  final double radius;
  final Color color;
  final Widget? child;
  final bool enableBorder;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final List<BoxShadow>? shadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: shadow,
          border: enableBorder
              ? Border.all(
                  width: borderWidth,
                  color: borderColor,
                )
              : null,
        ),
        child: Center(child: child),
      ),
    );
  }
}
