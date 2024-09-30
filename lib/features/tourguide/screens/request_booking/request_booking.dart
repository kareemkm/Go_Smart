import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/rows/driver_contact.dart';
import 'package:go_smart/features/tourguide/screens/confirm_booking/confirm_booking.dart';
import 'package:go_smart/common/widgets/list_tiles/car_type_tile.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class RequestBookingScreen extends StatelessWidget {
  const RequestBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CImages.map2),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(.2),
        appBar: const CAppBar(),
        body: SizedBox(
          height: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            //? rounded bottom sheet
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Column(children: [
                //? car tile
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffF7F7F7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: CSizes.defaultSpace),
                  child: CCarTypeTile(
                    showDivider: false,
                    image: CImages.car1,
                    title: "Ahmed",
                    subtitle: "Near by you",
                    cost: r"$25.00",
                    duration: "2 min",
                    costStyle: CTextStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.red),
                  ),
                ),
                //? driver contact
                const CDriverContactRow(),

                //? button
                CElevatedButton(
                  onPressed: () {
                    Get.to(() => const ConfirmBookingScreen());
                  },
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      right: CSizes.defaultSpace,
                      left: CSizes.defaultSpace,
                      bottom: CSizes.defaultSpace),
                  child: const Text("Request"),
                )
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
