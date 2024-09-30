import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_smart/common/widgets/containers/rounded_container.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CPaymentWayCard extends StatelessWidget {
  const CPaymentWayCard({super.key, required this.onTap, required this.image,this.isSelected = false});
  final VoidCallback onTap;
  final String image;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      onTap: onTap,
      enableBorder: true ,
      borderWidth: isSelected ? 2 : 1,
      borderColor:isSelected? CColors.primary: CColors.darkGrey,
      width: 103,
      height: 62,
      color: Colors.white,
      radius: CSizes.cardRadiusLg,
      shadow: isSelected ? [
        BoxShadow(
          color: CColors.primary.withOpacity(.2),
          spreadRadius: 2,
          blurRadius: 2
        )
      ] : null,
      child: SvgPicture.asset(image),
    );
  }
}
