import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/driver/features/driver_mode/screens/my_wallet/driver_wallet.dart';
import 'package:go_smart/driver/features/driver_mode/screens/driver_notifications/driver_notifications.dart';
import 'package:go_smart/driver/features/driver_mode/screens/profile/complete_profile.dart';
import 'package:go_smart/driver/features/driver_mode/screens/reviews/driver_reviews.dart';
import 'package:go_smart/driver/features/driver_mode/screens/bookings/driver_upcoming_bookings.dart';
import 'package:go_smart/features/authentication/screens/complete_your_profile/complete_your_profile.dart';
import 'package:go_smart/features/payment/screens/my_wallet/my_wallet.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class DriverNavigationMenu extends StatelessWidget {
  const DriverNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DriverNavigationMenuController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            iconSize: 20,
            selectedLabelStyle: CTextStyles.textStyle12,
            unselectedLabelStyle: CTextStyles.textStyle12,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.selectedTapIndex.value,
            selectedItemColor: CColors.primary,
            onTap: controller.setSelectedTap,
            items: [
              buildBottomNavigationBarItem(
                  icon: CImages.bell, label: "Notification"),
              buildBottomNavigationBarItem(
                  icon: const Icon(FontAwesomeIcons.calendarCheck,size: 20,),
                  label: "My Schedule"),
              buildBottomNavigationBarItem(
                  icon: const Icon(Icons.star_purple500_outlined,size: 20,), label: "Rating"),
              buildBottomNavigationBarItem(
                  icon: const Icon(Iconsax.wallet_2),
                  label: "My balance"),
              buildBottomNavigationBarItem(
                  icon: CImages.account, label: "Profile"),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedTapIndex.value]),
    );
  }

  buildBottomNavigationBarItem({required Object icon, required String label}) {
    if (icon is String) {
      return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              Color(0xff7A7A7A),
              BlendMode.srcIn,
            ),
            height: 20,
          ),
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: SvgPicture.asset(
            icon,
            height: 20,
            colorFilter: const ColorFilter.mode(
              CColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
        label: label,
      );
    } else if (icon is Widget) {
      return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: icon,
        ),
        label: label,
      );
    } else {
      return const BottomNavigationBarItem(icon: Icon(Icons.error), label: "");
    }
  }
}

class DriverNavigationMenuController extends GetxController {
  final Rx<int> selectedTapIndex = 0.obs;
  final screens = [
    const DriverNotificationsScreen(),
    const DriverUpcomingBookings(),
    const DriverReviewsScreen(),
    const DriverWalletScreen(),
    const DriverCompleteProfileScreen(),
  ];

  void setSelectedTap(int tapIndex) {
    selectedTapIndex.value = tapIndex;
  }
}
