import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/containers/rounded_container.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class DriverBookingWidget extends StatelessWidget {
  const DriverBookingWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.type,
      required this.cost,
      required this.isLast,
      required this.date});

  final String title;
  final String subtitle;
  final String type;
  final String cost;
  final bool isLast;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CRoundedContainer(
              height: 50,
              width: 50,
              radius: 10,
              child: SvgPicture.asset(
                CImages.bell,
                height: 25,
              ),
            ),
            const SizedBox(width: CSizes.spaceBtwItems),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CTextStyles.textStyle16
                      .copyWith(decoration: TextDecoration.underline),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  subtitle,
                  style:
                      CTextStyles.textStyle14.copyWith(color: CColors.darkGrey),
                ),
                const SizedBox(height: CSizes.xs),
                Text(
                  type,
                  style: CTextStyles.textStyle14
                      .copyWith(color: CColors.primary.withOpacity(.5)),
                ),
                const SizedBox(height: CSizes.spaceBtwItems / 2),
                Text(
                  cost,
                  style: CTextStyles.textStyle14,
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 45),
                Text(
                  date,
                  style:
                      CTextStyles.textStyle16.copyWith(color: CColors.darkGrey),
                ),
                const SizedBox(width: CSizes.spaceBtwItems),
                Text(
                  "View details",
                  style:
                      CTextStyles.textStyle14.copyWith(color: CColors.primary).copyWith(decoration: TextDecoration.underline),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        if (!isLast) const Divider(color: Colors.grey,)
      ],
    );
  }
}
