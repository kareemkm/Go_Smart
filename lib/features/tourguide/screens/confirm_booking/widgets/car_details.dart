import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CCarDetails extends StatelessWidget {
  const CCarDetails(
      {super.key,
      required this.image,
      required this.distance,
      required this.time,
      required this.price});
  final String image;
  final String distance;
  final String time;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(image),
        Column(
          children: [
            Text(
              "DISTANCE",
              style: CTextStyles.textStyle13.copyWith(
                  color: CColors.darkGrey, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: CSizes.sm),
            Text(distance,style: CTextStyles.textStyle15.copyWith(fontWeight: FontWeight.bold),),
          ],
        ),
        Column(
          children: [
            Text(
              "TIME",
              style: CTextStyles.textStyle13.copyWith(
                  color: CColors.darkGrey, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: CSizes.sm),
            Text(time,style: CTextStyles.textStyle15.copyWith(fontWeight: FontWeight.bold),),
          ],
        ),
        Column(
          children: [
            Text(
              "PRICE",
              style: CTextStyles.textStyle13.copyWith(
                  color: CColors.darkGrey, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: CSizes.sm),
            Text(price,style: CTextStyles.textStyle15.copyWith(fontWeight: FontWeight.bold),),
          ],
        ),
        
      ],
    );
  }
}
