import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/features/planing/screens/go_smart_no_guide/no_guide.dart';
import 'package:go_smart/features/planing/screens/view_plan/view_plan.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class RecentPlans extends StatelessWidget {
  const RecentPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Your Recent Plans", style: CTextStyles.textStyle20),
        const SizedBox(height: CSizes.spaceBtwItems),
        GestureDetector(
          onTap: () =>
              Get.to(() => const ViewPlanScreen(planName: "Plan name")),
          child: Row(
            children: [
              const Icon(
                Icons.history,
                color: CColors.darkGrey,
              ),
              const SizedBox(width: CSizes.sm),
              Text(
                "Alexandria",
                style: CTextStyles.textStyle16.copyWith(
                  color: CColors.darkGrey,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        GestureDetector(
          onTap: () =>
              Get.to(() => const GoSmartNoGuideScreen(cityName: "Cairo")),
          child: Row(
            children: [
              const Icon(
                Icons.history,
                color: CColors.darkGrey,
              ),
              const SizedBox(width: CSizes.sm),
              Text(
                "Cairo",
                style: CTextStyles.textStyle16.copyWith(
                  color: CColors.darkGrey,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
