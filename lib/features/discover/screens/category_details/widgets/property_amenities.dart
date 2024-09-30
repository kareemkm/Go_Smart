import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class PropertyAmenitiesSection extends StatelessWidget {
  const PropertyAmenitiesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Icon(Icons.monetization_on_outlined, color: CColors.primary),
            SizedBox(width: CSizes.sm),
            Text("Paid private parking on-site")
          ],
        ),
        SizedBox(height: CSizes.sm),
        Row(
          children: [
            Icon(Icons.wifi, color: CColors.primary),
            SizedBox(width: CSizes.sm),
            Text("Free High Speed Internet (WiFi)")
          ],
        ),
        SizedBox(height: CSizes.sm),
        Row(
          children: [
            Icon(Icons.free_breakfast_outlined, color: CColors.primary),
            SizedBox(width: CSizes.sm),
            Expanded(
              child: Text(
                "Breakfast available",
              ),
            )
          ],
        ),
      ],
    );
  }
}
