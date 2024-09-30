import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/navigation_menu.dart';
import 'package:go_smart/utils/constants/image_strings.dart';

class SuccessBookingScreen extends StatelessWidget {
  const SuccessBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CImages.map4),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CAppBar(
          onTapBackArrow: (){
            Get.find<NavigationMenuController>().selectedTapIndex(0); //? going to home tap not tha current opened tap
              Get.offAll(() => const NavigationMenu());
          },
          
        ),
      ),
    );
  }
}
