import 'package:flutter/material.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/rows/driver_contact.dart';
import 'package:go_smart/features/tourguide/screens/confirm_booking/widgets/car_details.dart';
import 'package:go_smart/features/tourguide/screens/confirm_booking/widgets/confirm_booking_dialog.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class ConfirmBookingScreen extends StatelessWidget {
  const ConfirmBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CImages.map3),
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
                //? car details
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffF7F7F7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: CSizes.spaceBtwSections,
                      horizontal: CSizes.spaceBtwSections),
                  child: const CCarDetails(
                      image: CImages.car1,
                      distance: "0.2 km",
                      time: "2 min",
                      price: "\$25.00"),
                ),

                //? driver contact
                const CDriverContactRow(),
                //? button
                CElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const ConfirmBookingDialog()
                    );
                  },
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      right: CSizes.defaultSpace,
                      left: CSizes.defaultSpace,
                      bottom: CSizes.defaultSpace),
                  child: const Text("Confirm"),
                )
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
