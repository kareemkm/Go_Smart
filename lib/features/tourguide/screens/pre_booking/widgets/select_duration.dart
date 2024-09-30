import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/features/tourguide/controller/pre_booking/pre_booking_controller.dart';

class CSelectDuration extends StatelessWidget {
  const CSelectDuration({super.key});

  @override
  Widget build(BuildContext context) {
    PreBookingController controller = Get.find<PreBookingController>();


    return Obx(
      () => Column(
        children: [
          Row(
            children: [
              Radio(
                  value: 0,
                  groupValue: controller.selectedDurationIndex.value,
                  onChanged: (_) {
                    controller.setSelected(0, "3 - 6 hours");
                  }),
              const Text(
                "3 - 6 hours",
                style: CTextStyles.textStyle16,
              )
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 1,
                  groupValue: controller.selectedDurationIndex.value,
                  onChanged: (_) {
                    controller.setSelected(1, "Mid-day");
                  }),
              const Text(
                "Mid-day",
                style: CTextStyles.textStyle16,
              )
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 2,
                  groupValue: controller.selectedDurationIndex.value,
                  onChanged: (_) {
                    controller.setSelected(2, "Full - day");
                  }),
              const Text(
                "Full - day",
                style: CTextStyles.textStyle16,
              )
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 3,
                  groupValue: controller.selectedDurationIndex.value,
                  onChanged: (_) {
                    controller.setSelected(3, "More 1 day");
                  }),
              const Text(
                "More 1 day",
                style: CTextStyles.textStyle16,
              )
            ],
          ),
        ],
      ),
    );
  }
}
