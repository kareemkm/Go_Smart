import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/buttons/underline_text_button.dart';
import 'package:go_smart/features/planing/shared/screens/based_on_your_selected.dart';
import 'package:go_smart/features/planing/shared/widgets/duration_and_date.dart';
import 'package:go_smart/features/planing/shared/widgets/plan_steps_row.dart';
import 'package:go_smart/features/planing/shared/widgets/review_selection.dart';
import 'package:go_smart/navigation_menu.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class ViewPlanScreen extends StatelessWidget {
  const ViewPlanScreen({super.key, required this.planName});
  final String planName;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CAppBar(
          title: planName,
          onTapBackArrow: () {
            Get.find<NavigationMenuController>().setSelectedTap(1);
            Get.offAll(() => const NavigationMenu());
          },
        ),
        body: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
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
                    onTap: () {
                      Get.to(
                        () => BasedOnYourSelectedScreen(
                          action: CElevatedButton(
                            onPressed: () {
                              Get.find<NavigationMenuController>().setSelectedTap(1);
                              Get.offAll(() => const NavigationMenu());
                            },
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                horizontal: CSizes.defaultSpace),
                            child: const Text("Done"),
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
