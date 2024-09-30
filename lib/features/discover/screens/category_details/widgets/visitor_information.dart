import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class VisitorInformationSection extends StatelessWidget {
  const VisitorInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: CColors.primary),
            SizedBox(width: CSizes.sm),
            Text("Zizenia neighborhood, Alexandria, Egypt.")
          ],
        ),
        SizedBox(height: CSizes.sm),
        Row(
          children: [
            Icon(Icons.access_time, color: CColors.primary),
            SizedBox(width: CSizes.sm),
            Text("Opening hours: 8:00 AM to 5:00 PM daily.")
          ],
        ),
        SizedBox(height: CSizes.sm),
        Row(
          children: [
            Icon(Icons.money, color: CColors.primary),
            SizedBox(width: CSizes.sm),
            Expanded(
              child: Text(
                "Admission fees: 100 EGP for adults, 50 EGP for students, free for children under 6 years old.",
              ),
            )
          ],
        ),
      ],
    );
  }
}
