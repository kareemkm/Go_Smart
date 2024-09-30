import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';

class CustomSectionHeadline extends StatelessWidget {
  const CustomSectionHeadline(
      {super.key,
      required this.headText,
      required this.onTap,
      required this.seeAll, this.headTextStyle});
  final VoidCallback onTap;
  final String headText;
  final TextStyle? headTextStyle;
  final String seeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          headText,
          style: headTextStyle ?? CTextStyles.textStyle16,
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            seeAll,
            style: CTextStyles.textStyle16.copyWith(
              color: CColors.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
