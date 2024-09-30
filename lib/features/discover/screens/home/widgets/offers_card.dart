import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/containers/rounded_container.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({
    super.key,
    required this.image,
    required this.title,
    this.titleColor = Colors.white,
    required this.cardColor,
    required this.titleAlignment, required this.onTap,
  });
  final Positioned image;
  final String title;
  final Color titleColor;
  final Color cardColor;
  final AlignmentGeometry titleAlignment;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
          CRoundedContainer(
            color: cardColor,
            radius: 5,
            margin: const EdgeInsets.only(right: CSizes.defaultSpace,left: CSizes.defaultSpace,top: 20),
            child: const SizedBox(),
          ),
          image,
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: titleAlignment,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: CSizes.lg),
                width: 220,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: CTextStyles.textStyle20.copyWith(
                      fontWeight: FontWeight.w600,
                      color: titleColor,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
