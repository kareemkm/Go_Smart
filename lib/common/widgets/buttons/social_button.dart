import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon,color: CColors.primary,size: 32),
    );
  }
}
