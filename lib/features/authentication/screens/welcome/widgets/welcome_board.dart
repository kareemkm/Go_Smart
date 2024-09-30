import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';

class WelcomeBoard extends StatelessWidget {
  const WelcomeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/welcome.jpg",
          fit: BoxFit.cover,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 191,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'welcome to ',
                    style: TextStyle(
                        color: Color(0xFFFFFBFE),
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .64),
                  ),
                  Text(
                    'GO SMART',
                    style: TextStyle(
                        color: CColors.primary,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        letterSpacing: .64),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
