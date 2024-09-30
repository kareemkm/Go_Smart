import 'package:flutter/material.dart';
import 'package:go_smart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:go_smart/utils/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return const OnBoardingScreen();
        }),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          const Text('Go Smart',
              style: TextStyle(
                color: Color(0xFFFFFBFE),
                fontSize: 40,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.8,
              )),
        ],
      ),
    );
  }
}
