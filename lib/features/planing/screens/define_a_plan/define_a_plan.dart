import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/buttons/underline_text_button.dart';
import 'package:go_smart/features/planing/controllers/define_a_plan/define_a_plan_controller.dart';
import 'package:go_smart/features/planing/shared/widgets/duration_and_date.dart';
import 'package:go_smart/features/planing/shared/widgets/plan_steps_row.dart';
import 'package:go_smart/navigation_menu.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class DefineAPlanScreen extends StatelessWidget {
  const DefineAPlanScreen({super.key, required this.planName});
  final String planName;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:  CAppBar(title: "Plan $planName"),
      body: SingleChildScrollView(
        child: GetBuilder(
          init: DefineAPlanController(),
          builder: (DefineAPlanController controller) => Padding(
            padding: const EdgeInsets.fromLTRB(CSizes.defaultSpace, 0,
                CSizes.defaultSpace, CSizes.defaultSpace),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //? duration and date
              const CPlanDurationAndDate(),
              PlanStepsRow(
                currentStep: controller.currentStep,
              ),
              SizedBox(height: 480, child: controller.currentScreen),
              controller.hideButtons == false
                  ? Padding(
                      padding: const EdgeInsets.only(top: CSizes.spaceBtwItems),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CUnderlineTextButton(
                            text: controller.currentStep == 3
                                ? controller.withTourguide
                                    ? "Next"
                                    : "Finish"
                                : "Next",
                            onTap: () {
                              controller.currentStep == 3
                                  ? controller.withTourguide
                                      ? controller.toPlanWithTourguide()
                                      : controller.toReviewSelection()
                                  : controller.nextStep();
                            },
                            color: CColors.primary,
                          ),
                          CUnderlineTextButton(
                              text: "Back",
                              onTap: () {
                                controller.backStep();
                              }),
                        ],
                      ),
                    )
                  : CElevatedButton(
                      onPressed: () {
                        Get.find<NavigationMenuController>().setSelectedTap(1);
                        Get.offAll(() => const NavigationMenu());
                      },
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 4),
                      child: const Text("Done"),
                    )
            ]),
          ),
        ),
      ),
    );
  }
}
