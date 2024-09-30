import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/features/planing/screens/plan/widgets/recent_plans.dart';
import 'package:go_smart/features/planing/screens/try_to_go_smart/try_to_go_smart.dart';
import 'package:go_smart/features/planing/screens/do_it_yourself/plan_a_trip.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        title: "Plan",
        showBackArrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: CSizes.spaceBtwSections),
            GestureDetector(
              onTap: () {
                Get.to(() => const PlanATripScreen());
              },
              child: Row(
                children: [
                  CCircularContainer(
                    height: 36,
                    width: 36,
                    child: SvgPicture.asset(CImages.account),
                  ),
                  const SizedBox(width: CSizes.sm),
                  const Text("Do it yourself", style: CTextStyles.textStyle20)
                ],
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwSections),
            GestureDetector(
              onTap: () {
                Get.to(() => const TryToGoSmartScreen());
              },
              child: Row(
                children: [
                  CCircularContainer(
                    height: 36,
                    width: 36,
                    child: SvgPicture.asset(CImages.cloudSpark),
                  ),
                  const SizedBox(width: CSizes.sm),
                  const Text("Try to go smart", style: CTextStyles.textStyle20)
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: CSizes.spaceBtwItems),
              child: Divider(
                height: 0,
                thickness: 1,
                color: CColors.primary.withOpacity(.5),
              ),
            ),
            //? recent plans 
            const RecentPlans(),
          ]),
        ),
      ),
    );
  }
}
