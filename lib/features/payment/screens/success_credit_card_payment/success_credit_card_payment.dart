import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/features/payment/screens/success_credit_card_payment/widgets/build_ticket.dart';
import 'package:go_smart/features/planing/screens/view_plan/view_plan.dart';
import 'package:go_smart/features/tourguide/screens/success_booking/success_booking.dart';
import 'package:go_smart/navigation_menu.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:go_smart/utils/enums/payment_in.dart';
import 'package:go_smart/utils/helpers/helper_functions.dart';

class SuccessCreditCardPayment extends StatelessWidget {
  const SuccessCreditCardPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 750,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CAppBar(
                  leading: IconButton(
                      onPressed: () {
                        if (Get.arguments['type'] ==  PaymentUsedIn.driverBooking) {
                          Get.to(() => const SuccessBookingScreen());
                        } else if (Get.arguments['type'] == PaymentUsedIn.tourguideBooking) {
                          Get.find<NavigationMenuController>()
                              .selectedTapIndex(0);
                          Get.offAll(() => const NavigationMenu());
                        } else if (Get.arguments['type'] == PaymentUsedIn.planTourguideBooking) {
                          Get.to(() =>
                              const ViewPlanScreen(planName: "Plan Name"));
                        } else if (Get.arguments['type'] == PaymentUsedIn.planGoSmartBooking) {
                          Get.find<NavigationMenuController>()
                              .selectedTapIndex(1);
                          Get.offAll(() => const NavigationMenu());
                        }
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                ),
                //? build our ticket
                const BuildTicket(),
                
                Positioned(
                  top: 55,
                  left: CHelperFunctions.screenWidth(context) / 2 - 40,
                  child: const CCircularContainer(
                    width: 80,
                    height: 80,
                    color: CColors.primary,
                    shadow: [
                      BoxShadow(
                        spreadRadius: 10,
                        color: CColors.softGrey,
                      )
                    ],
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: CSizes.iconXLg,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 166,
                  left: 2,
                  child: CCircularContainer(
                    height: 25,
                    width: 25,
                    color: Color(0xffFCFCFC),
                    child: SizedBox(),
                  ),
                ),
                const Positioned(
                  bottom: 166,
                  right: 2,
                  child: CCircularContainer(
                    height: 25,
                    width: 25,
                    color: Color(0xffFCFCFC),
                    child: SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
