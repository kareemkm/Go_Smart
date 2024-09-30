import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';

class CUnderlineTextButton extends StatelessWidget {
  const CUnderlineTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
  });
  final String text;
  final VoidCallback onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: color ?? CColors.primary.withOpacity(.5), width: 2),
          ),
        ),
        child: Text(
          text,
          style: CTextStyles.textStyle16.copyWith(
            color: color ?? CColors.primary.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
