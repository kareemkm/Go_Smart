import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key, required this.onTap, required this.title, required this.icon});
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: CColors.primary,
          ),
          const SizedBox(width: CSizes.sm),
          Text(title)
        ],
      ),
    );
  }
}
