import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:go_smart/utils/helpers/helper_functions.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        showBackArrow: true,
        title: "Notification",
      ),
      body: SingleChildScrollView(
        child: Container(
          width: CHelperFunctions.screenWidth(context),
          height: CHelperFunctions.screenHeight(context) -
              CSizes.appBarHeight -
              CSizes.defaultSpace * 2,
          padding: const EdgeInsets.all(
            CSizes.defaultSpace,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //? icon with with circular background
              CCircularContainer(
                child: Stack(alignment: Alignment.center, children: [
                  SvgPicture.asset(CImages.notification),
                  Transform.rotate(
                    angle: -pi / 4,
                    child: Container(
                      width: 100,
                      height: 2,
                      color: CColors.primary,
                    ),
                  )
                ]),
              ),
              //? title text and subtitle
              const SizedBox(height: CSizes.spaceBtwSections * 2),
              Text(
                "No notification",
                style: CTextStyles.textStyle24.copyWith(color: CColors.primary),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                "You have no notification at this time\n thank you",
                style:
                    CTextStyles.textStyle16.copyWith(color: CColors.darkGrey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
