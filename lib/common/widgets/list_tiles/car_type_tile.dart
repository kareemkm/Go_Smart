import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CCarTypeTile extends StatelessWidget {
  const CCarTypeTile(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.cost,
      required this.duration,
      this.showDivider = true,
      this.onTap, this.costStyle});
  final String image;
  final String title;
  final String subtitle;
  final String cost;
  final TextStyle? costStyle;
  final String duration;
  final VoidCallback? onTap;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: ListTile(
            onTap: onTap,
            horizontalTitleGap: CSizes.sm,
            dense: true,
            titleAlignment: ListTileTitleAlignment.center,
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cost, style: costStyle ?? CTextStyles.textStyle20),
                Text(
                  duration,
                  style:
                      CTextStyles.textStyle15.copyWith(color: CColors.darkGrey),
                ),
              ],
            ),
            leading: SvgPicture.asset(image,width: 49,),
            title: Text(title, style: CTextStyles.textStyle17),
            subtitle: Text(
              subtitle,
              style: CTextStyles.textStyle15.copyWith(color: CColors.darkGrey),
            ),
          ),
        ),
        if(showDivider) const Divider(thickness: 1)
      ],
    );
  }
}
