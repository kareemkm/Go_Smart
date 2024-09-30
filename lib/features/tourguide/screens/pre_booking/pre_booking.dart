import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/text_fields/stadium_text_field.dart';
import 'package:go_smart/features/tourguide/controller/pre_booking/pre_booking_controller.dart';
import 'package:go_smart/features/tourguide/screens/pre_booking/widgets/select_duration.dart';
import 'package:go_smart/features/tourguide/screens/tour_guides/tour_guides.dart';
import 'package:go_smart/utils/constants/sizes.dart';


class PreBookingScreen extends StatelessWidget {
  const PreBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PreBookingController controller = Get.put(PreBookingController());
    return Scaffold(
      appBar: const CAppBar(
        title: "Pre-Booking",
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? text form fields section
            Form(
              child: Column(
                children: [
                  CStadiumTextField(
                    icon: const Icon(Icons.calendar_month),
                    hintText: "DD/MM/YY",
                    title: " select Date",
                    readOnly: true,
                    controller: controller.dateController,
                    onTap: () async {
                      controller.showDatePicker(context);
                    },
                  ),
                  const CStadiumTextField(
                      icon: Icon(Icons.location_on_outlined),
                      hintText: "location",
                      title: " select your Start point"),
                  const CStadiumTextField(
                      icon: Icon(Icons.location_on_outlined),
                      hintText: "location",
                      title: " select your End point"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: CSizes.spaceBtwItems),
              child: Text(
                " select your duration",
                style: CTextStyles.textStyle20,
              ),
            ),

            //? select duration section
            const CSelectDuration(),
            
            //? Elevated button
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: CSizes.spaceBtwItems),
              child: CElevatedButton(
                onPressed: () {
                  Get.to(() => const TourGuidesScreen());
                },
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
                child: const Text("Check availability"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
