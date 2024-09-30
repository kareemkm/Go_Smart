import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/features/planing/shared/widgets/review_selection.dart';
import 'package:go_smart/navigation_menu.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class GoSmartNoGuideScreen extends StatelessWidget {
  const GoSmartNoGuideScreen({super.key, required this.cityName});
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CAppBar(title: "To $cityName"),
        body: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //? duration and date
                // const CPlanDurationAndDate(),
                const SizedBox(height: CSizes.spaceBtwSections),
                Container(
                  height: 530,
                  padding:
                      const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
                  child: const ReviewSelection(),
                ),
                CElevatedButton(
                  onPressed: () {
                    Get.find<NavigationMenuController>().setSelectedTap(1);
                    Get.offAll(() => const NavigationMenu());
                  },
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: CSizes.defaultSpace,
                  ),
                  child: const Text("Done"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
