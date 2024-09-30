import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'location_permission.dart';

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              //? icon with with circular background
              CCircularContainer(
                child: SvgPicture.asset(CImages.notification),
              ),
              //? title text and subtitle
              const SizedBox(height: CSizes.spaceBtwSections * 2),
              const Text(
                "Enable notification access",
                style: CTextStyles.textStyle24,
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                "Enable notification access to receive all updates",
                style:
                    CTextStyles.textStyle16.copyWith(color: CColors.darkGrey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CSizes.spaceBtwSections * 2),

              //? elevated button
              CElevatedButton(
                onPressed: () {},
                width: double.infinity,
                child: const Text("Allow notification"),
              ),

              //? text button
              TextButton(
                onPressed: () {
                  Get.offAll(() => const LocationPermissionScreen());
                },
                child: Text(
                  "May be later",
                  style: CTextStyles.textStyle16.copyWith(
                    color: CColors.primary,
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
