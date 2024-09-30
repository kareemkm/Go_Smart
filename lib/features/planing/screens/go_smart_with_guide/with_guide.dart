import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/buttons/underline_text_button.dart';
import 'package:go_smart/common/widgets/dialogs/main_alert_dialog.dart';
import 'package:go_smart/features/payment/screens/payment_method/payment_method.dart';
import 'package:go_smart/features/payment/screens/webview/webview.dart';
import 'package:go_smart/features/planing/shared/screens/based_on_your_selected.dart';
import 'package:go_smart/features/planing/shared/widgets/duration_and_date.dart';
import 'package:go_smart/features/planing/shared/widgets/plan_steps_row.dart';
import 'package:go_smart/features/planing/shared/widgets/review_selection.dart';
import 'package:go_smart/navigation_menu.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:go_smart/utils/enums/payment_in.dart';

import '../../../../driver/features/driver_mode/controller/driver_controller.dart';

class GoSmartWithGuideScreen extends StatelessWidget {
  const GoSmartWithGuideScreen({super.key, required this.cityName});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverController>(
      init: DriverController()..getAllDriver(cityName),
      builder:(controller) =>  DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: CAppBar(
            title: "To $cityName",
            onTapBackArrow: () {
              Get.find<NavigationMenuController>().setSelectedTap(1);
              Get.offAll(() => const NavigationMenu());
            },
          ),
          body: SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                //? duration and date
                const CPlanDurationAndDate(),
                //? two rounded containers as two steps
                const PlanStepsRow(
                  currentStep: 1,
                  length: 2,
                ),
                Container(
                  height: 480,
                  padding:
                      const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
                  child: const ReviewSelection(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: CSizes.defaultSpace),
                  child: CUnderlineTextButton(
                    text: "Next",
                    onTap: () async{
                      Get.to(
                        () => BasedOnYourSelectedScreen(
                          model: controller.Driver,
                          title: "Based on your needs We recommend",
                          action: CElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => CAlertDialog(
                                  trailing: CElevatedButton(
                                    onPressed: () async{
                                      await controller.payments();
                                      Get.to(
                                        () => web(url: controller.payment.url ?? '')
                                      );
                                    },
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                            horizontal: CSizes.defaultSpace)
                                        .copyWith(bottom: CSizes.defaultSpace),
                                    child: const Text("Pay \$80"),
                                  ),
                                  content: "The total cost for service is \$80. Please complete your payment to continue",
                                ),
                              );
                            },
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                              horizontal: CSizes.defaultSpace,
                            ),
                            child: const Text("Confirm Booking"),
                          ),
                        ),
                      );
                    },
                    color: CColors.primary,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
