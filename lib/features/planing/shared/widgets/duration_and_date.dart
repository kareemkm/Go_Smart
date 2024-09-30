import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CPlanDurationAndDate extends StatelessWidget {
  const CPlanDurationAndDate({super.key,this.duration ="3 Days\t",this.date = "01 May to 03"});
  final String duration;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          duration,
          style: CTextStyles.textStyle14.copyWith(
            color: CColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: CSizes.sm),
        Text(
          date,
          style: CTextStyles.textStyle14.copyWith(
            color: CColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
