import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CPaymentDetails extends StatelessWidget {
  const CPaymentDetails({super.key, required this.date, required this.time, required this.to});
  final String date;
  final String time;
  final String to;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Date", style: CTextStyles.textStyle18),
            Text(
              date,
              style:
                  CTextStyles.textStyle18.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Time", style: CTextStyles.textStyle18),
            Text(
              time,
              style:
                  CTextStyles.textStyle18.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("To", style: CTextStyles.textStyle18),
            Text(
              to,
              style:
                  CTextStyles.textStyle18.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
