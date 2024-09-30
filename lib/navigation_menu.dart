import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_smart/features/personalization/screens/profile/profile.dart';
import 'package:go_smart/features/planing/screens/plan/plan.dart';
import 'package:go_smart/features/tourguide/screens/find_your_tourguide/find_tourguide.dart';
import 'package:go_smart/features/discover/screens/home/home.dart';
import 'package:go_smart/features/discover/screens/saved/saved.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.selectedTapIndex.value,
            selectedItemColor: CColors.primary,
            onTap: controller.setSelectedTap,
            items:  [
              const BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.houseChimney), label: 'Home'),
              const BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.calendarCheck), label: 'Plan'),
              const BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.solidBookmark), label: 'Saved'),
              const BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.route),
                  label: 'Tourguide'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    CImages.account,
                    height: 24,
                    colorFilter: const ColorFilter.mode(Color(0xff7A7A7A), BlendMode.srcIn),
                  ),
                  activeIcon: SvgPicture.asset(
                    CImages.account,
                    height: 24,
                    colorFilter:
                        const ColorFilter.mode(CColors.primary, BlendMode.srcIn),
                  ),
                  label: 'Profile'),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedTapIndex.value]),
    );
  }
}

class NavigationMenuController extends GetxController {
  final Rx<int> selectedTapIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const PlanScreen(),
    const SavedScreen(),
    const FindYourTourguideScreen(),
    const ProfileScreen(),
  ];

  void setSelectedTap(int tapIndex) {
    selectedTapIndex.value = tapIndex;
  }
}
