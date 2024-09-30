import 'package:flutter/material.dart';

class CustomBoard extends StatelessWidget {
  const CustomBoard({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(image, fit: BoxFit.cover),
        Column(
          children: [
            const SizedBox(
              height: 191,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title,
                style: const TextStyle(
                    color: Color(0xFFFFFBFE),
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .64),
              ),
            )
          ],
        )
      ],
    );
  }
}
