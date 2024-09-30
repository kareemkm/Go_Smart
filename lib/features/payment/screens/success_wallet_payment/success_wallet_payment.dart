import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/features/planing/screens/view_plan/view_plan.dart';
import 'package:go_smart/features/tourguide/screens/success_booking/success_booking.dart';
import 'package:go_smart/navigation_menu.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:go_smart/utils/enums/payment_in.dart';

class SuccessWalletPaymentScreen extends StatelessWidget {
  const SuccessWalletPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CCircularContainer(
              onTap: () {
                if (Get.arguments['type'] == PaymentUsedIn.driverBooking) {
                  Get.to(() => const SuccessBookingScreen());
                } else if (Get.arguments['type'] == PaymentUsedIn.tourguideBooking) {
                  Get.find<NavigationMenuController>().selectedTapIndex(0);
                  Get.offAll(() => const NavigationMenu());
                } else if (Get.arguments['type'] == PaymentUsedIn.planTourguideBooking) {
                  Get.to(() => const ViewPlanScreen(planName: "Plan Name"));
                } else if (Get.arguments['type'] == PaymentUsedIn.planGoSmartBooking) {
                  Get.find<NavigationMenuController>().selectedTapIndex(1);
                  Get.offAll(() => const NavigationMenu());
                }
              },
              color: CColors.primary,
              height: 76,
              width: 76,
              shadow: [
                BoxShadow(
                  spreadRadius: 8,
                  color: CColors.primary.withOpacity(.1),
                ),
              ],
              child: const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: CSizes.iconLg,
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
            Text(
              "Payment Successful",
              style:
                  CTextStyles.textStyle17.copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
