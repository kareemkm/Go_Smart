import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CRoundedImage extends StatelessWidget {
  const CRoundedImage({
    super.key,
    required this.image,
    this.text,
    this.child,
    this.radius = 5,
    this.isNetworkImage = false,
    this.mainAxisAlignment = MainAxisAlignment.end,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.onTap,
    this.width,
    this.height,
    this.padding
  });
  final String image;
  final String? text;
  final Widget? child;
  final double? width;
  final double? height;
  final double radius;
  final bool isNetworkImage;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: isNetworkImage
                ? NetworkImage(image) as ImageProvider
                : AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: text != null || child!=null
            ? Padding(
                padding: padding ?? const EdgeInsets.all(CSizes.md),
                child: Column(
                  mainAxisAlignment: mainAxisAlignment,
                  crossAxisAlignment: crossAxisAlignment,
                  children: [
                    if(text!=null) Text(
                      text!,
                      style: CTextStyles.textStyle16.copyWith(color: Colors.white),
                    ),
                    if(child != null) child!

                  ],
                ),
              )
            : null,
      ),
    );
  }
}
