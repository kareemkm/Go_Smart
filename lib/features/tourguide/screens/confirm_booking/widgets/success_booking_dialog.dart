import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/features/tourguide/screens/success_booking/success_booking.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class SuccessBookingDialog extends StatelessWidget {
  const SuccessBookingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(vertical: 40),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CCircularContainer(
            color: CColors.primary,
            height: 76,
            width: 76,
            shadow: [
              BoxShadow(
                spreadRadius: 8,
                color: CColors.primary.withOpacity(.1),
              ),
            ],
            child: const Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: CSizes.iconLg,
            ),
          ),
          const SizedBox(height: CSizes.spaceBtwItems),
          Text(
            "Booking Successful",
            style:
                CTextStyles.textStyle17.copyWith(fontWeight: FontWeight.w600),
          )
        ],
      ),
      actionsPadding: EdgeInsets.zero,
      actions: [
        Column(
          children: [
            const Divider(height: 0, thickness: 1),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Get.to(() => const SuccessBookingScreen());
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "Done",
                  style: CTextStyles.textStyle16
                      .copyWith(fontWeight: FontWeight.w600,color: CColors.primary),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
