import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class ClickableContainer extends StatelessWidget {
  const ClickableContainer({
    super.key,
    required this.categoryText,
    this.isClicked = false,
    required this.categoryIcon,
    required this.onTap,
  });
  final bool isClicked;
  final String categoryText;
  final IconData categoryIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isClicked ?CColors.primary : const Color(0xffEDEBEB)),
            child: Icon(categoryIcon,
                color: isClicked ? const Color(0xffEDEBEB) :CColors.primary),
          ),
          const SizedBox(height: CSizes.sm),
          Text(
            categoryText,
            style: TextStyle(
                color: isClicked ?CColors.primary :const Color(0xff9E9C9C)),
          ),
        ],
      ),
    );
  }
}
