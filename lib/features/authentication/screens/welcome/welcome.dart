import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/features/authentication/screens/welcome/widgets/welcome_board.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const WelcomeBoard(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CSizes.defaultSpace,
                    vertical: CSizes.spaceBtwItems),
                child: CElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'CreateAccountScreen');
                  },
                  width: double.infinity,
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style:
                        CTextStyles.textStyle16.copyWith(color: CColors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'SignInScreen');
                    },
                    child: Text(
                      'Sign in',
                      style: CTextStyles.textStyle16.copyWith(
                        color: CColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              )
            ],
          )
        ],
      ),
    );
  }
}
