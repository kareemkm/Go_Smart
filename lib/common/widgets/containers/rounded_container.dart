import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';

class CRoundedContainer extends StatelessWidget {
  const CRoundedContainer({
    super.key,
    this.height = 100,
    this.width = 100,
    this.color = CColors.softGrey,
    required this.child,
    this.enableBorder = false,
    this.borderColor,
    this.radius = 4,
    this.onTap,
    this.padding,
    this.margin,
    this.borderWidth, this.shadow,
  });
  final double? height;
  final double width;
  final double radius;
  final Color color;
  final Widget child;
  final bool enableBorder;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
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
                  color: borderColor!,
                  width: borderWidth!,
                )
              : null,
        ),
        child: Center(child: child),
      ),
    );
  }
}
