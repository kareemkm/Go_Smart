import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/common/widgets/containers/rounded_container.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class DriverNotificationWidget extends StatelessWidget {
  const DriverNotificationWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isNew,
    required this.isLast,
  });
  final String title;
  final String subtitle;
  final bool isNew;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CRoundedContainer(
                height: 48,
                width: 48,
                radius: 16,
                child: SvgPicture.asset(CImages.bell,height: 25,),
              ),
              const SizedBox(width: CSizes.spaceBtwItems),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: CTextStyles.textStyle16,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const Spacer(),
                        if(isNew) const CCircularContainer(
                          color: Colors.green,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 14,
                          width: 14,
                          radius: 7,
                        ),
                      ],
                    ),
                    Text(
                      subtitle,
                      style: CTextStyles.textStyle14
                          .copyWith(color: CColors.darkGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          if (!isLast)
            const Divider(
              color: Colors.grey,
            )
        ],
      ),
    );
  }
}
