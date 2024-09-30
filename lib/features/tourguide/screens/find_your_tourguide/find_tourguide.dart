import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/features/tourguide/screens/enable_location/enable_location.dart';
import 'package:go_smart/features/tourguide/screens/pre_booking/pre_booking.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class FindYourTourguideScreen extends StatelessWidget {
  const FindYourTourguideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        title: "Find Your Tour Guide ",
        showBackArrow: false,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CElevatedButton(
              onPressed: () {
                Get.to(() => const EnableLocationScreen());
              },
              width: double.infinity,
              child: const Text("Ask Immediately"),
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const PreBookingScreen());
                },
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text("Pre-booking"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
