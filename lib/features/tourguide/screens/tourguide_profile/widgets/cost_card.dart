import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CCostCard extends StatelessWidget {
  const CCostCard({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: CColors.primary.withOpacity(.5),
              // spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 4),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(height: CSizes.spaceBtwItems),
          Text(title)
        ],
      ),
    );
  }
}
