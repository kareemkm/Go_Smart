import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CListTile extends StatelessWidget {
  const CListTile(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon,
      this.showUnderLine = true});
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  final bool showUnderLine;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: CColors.primary,
                  size: CSizes.iconMd,
                ),
                const SizedBox(width: CSizes.spaceBtwItems),
                Text(
                  title,
                  style: CTextStyles.textStyle16,
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: CColors.primary,
                  size: CSizes.iconLg * 1.2,
                ),
              ],
            ),
          ),
          if (showUnderLine)
            Divider(
              thickness: 1,
              color: CColors.primary.withOpacity(.3),
            )
        ],
      ),
    );
  }
}
