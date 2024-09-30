import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class CDriverContactRow extends StatelessWidget {
  const CDriverContactRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
          horizontal: CSizes.defaultSpace, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.whatsapp,
                color: CColors.primary,
              ),
              SizedBox(width: CSizes.sm),
              Text(
                "Whatsapp",
                style: CTextStyles.textStyle14,
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.phone_outlined,
                color: CColors.primary,
              ),
              SizedBox(width: CSizes.sm),
              Text(
                "Phone",
                style: CTextStyles.textStyle14,
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Iconsax.user,
                color: CColors.primary,
              ),
              SizedBox(width: CSizes.sm),
              Text(
                "Profile",
                style: CTextStyles.textStyle14,
              )
            ],
          ),
        ],
      ),
    );
  }
}
