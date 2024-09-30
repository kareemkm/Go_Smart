import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/containers/rounded_container.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class SmallWhiteMasterCard extends StatelessWidget {
  const SmallWhiteMasterCard({super.key, required this.lastTwoDigits, required this.icon});
  final int lastTwoDigits;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      color: Colors.white,
      width: double.infinity,
      height: 75,
      radius: CSizes.cardRadiusMd,
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      child: Row(
        children: [
          icon,
          const SizedBox(width: CSizes.defaultSpace),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Credit Card",
                style: CTextStyles.textStyle18,
              ),
              Text(
                "Mastercard **$lastTwoDigits",
                style: CTextStyles.textStyle18.copyWith(color: Colors.black.withOpacity(.7)),
              )
            ],
          )
        ],
      ),
    );
  }
}
