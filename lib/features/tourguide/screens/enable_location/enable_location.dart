import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/buttons/underline_text_button.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/features/tourguide/screens/type_destination/type_destination.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:permission_handler/permission_handler.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //? icon with with circular background
                    CCircularContainer(
                      child: SvgPicture.asset(CImages.location),
                    ),
                    //? title text and subtitle
                    const SizedBox(height: CSizes.spaceBtwSections * 2),
                    const Text(
                      "Enable current location ",
                      style: CTextStyles.textStyle24,
                    ),
                    const SizedBox(height: CSizes.spaceBtwItems),
                    Text(
                      "You must allow your location access to Available Tour guide",
                      style: CTextStyles.textStyle16
                          .copyWith(color: CColors.darkGrey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: CSizes.spaceBtwSections * 2),
                    //? elevated button
                    CElevatedButton(
                      onPressed: () async{
                        await requestLocationPermission();
                        Get.to(() => const TypeDestinationScreen());
                      },
                      width: double.infinity,
                      child: const Text("Allow location access"),
                    ),
                    const SizedBox(height: CSizes.spaceBtwSections * 6),
                  ]),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: CSizes.defaultSpace,
          child: CUnderlineTextButton(
            onTap: () {
              Get.back();
            },
            text: "Back",
          ),
        )
      ]),
    );
  }

  requestLocationPermission() async{
    await Permission.location.request();
  }

}
