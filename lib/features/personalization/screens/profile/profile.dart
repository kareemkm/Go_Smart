import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/driver/features/driver_mode/controller/driver_controller.dart';
import 'package:go_smart/driver/features/driver_mode/screens/driver_navigation_menu.dart';
import 'package:go_smart/features/authentication/screens/login/login.dart';
import 'package:go_smart/common/widgets/list_tiles/list_tile.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DriverController());
    return Scaffold(
      appBar: CAppBar(
        title: "My Account",
        showBackArrow: false,
        actions: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: CCircularContainer(
              onTap: () {},
              height: 36,
              width: 36,
              padding: const EdgeInsets.all(CSizes.sm - 2),
              margin: const EdgeInsets.only(right: CSizes.md),
              child: SvgPicture.asset(CImages.account),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CListTile(
              onTap: () {},
              title: "My plans",
              icon: FontAwesomeIcons.calendarCheck,
            ),
            CListTile(
              onTap: () {

                Get.to(() => const DriverNavigationMenu());
              },
              title: "Switch to drive mode",
              icon: FontAwesomeIcons.carSide,
            ),
            CListTile(
              onTap: () {},
              title: "My wallet",
              icon: Iconsax.wallet_2,
            ),
            CListTile(
              onTap: () {},
              title: "Setting",
              icon: Icons.settings,
            ),
            CListTile(
              onTap: () {},
              title: "Delete account",
              icon: Icons.auto_delete_outlined,
            ),
            CListTile(
              onTap: () {},
              title: "Support",
              icon: Icons.help_outline_sharp,
            ),
            const SizedBox(height: CSizes.spaceBtwSections),
            CElevatedButton(
              onPressed: () {
                Get.offAll(() => const LoginScreen());
              },
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
              child: const Text("Sign Out"),
            )
          ],
        ),
      ),
    );
  }
}
