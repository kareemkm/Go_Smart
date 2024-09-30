import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/buttons/social_button.dart';
import 'package:go_smart/common/widgets/text_fields/text_field_with_title.dart';
import 'package:go_smart/features/authentication/screens/complete_your_profile/complete_your_profile.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/const.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import '../../controllers/Auth_controller/Auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<LoginScreen> {
  AuthController controller = Get.put(AuthController());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Text(
                        'Sign In',
                        style: CTextStyles.textStyle24,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: CSizes.spaceBtwItems),
                      Text(
                        'Welcome back , you have been missed',
                        style: CTextStyles.textStyle16
                            .copyWith(color: CColors.darkGrey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
            CTextFieldWithTitle(
              controller: email,
              hintText: 'example@gmail.com',
              title: 'Email',
              obSecure: false,
            ),
            const SizedBox(height: CSizes.spaceBtwInputFields),
             CTextFieldWithTitle(
              controller: password,
              hintText: '*****',
              title: 'Password',
              obSecure: true,
            ),
            const SizedBox(height: CSizes.spaceBtwInputFields),
            GestureDetector(
              onTap: () {},
              child: Text(
                'forget password?',
                style: CTextStyles.textStyle16.copyWith(
                  color: CColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CSizes.sm, vertical: CSizes.spaceBtwSections),
              child: CElevatedButton(
                onPressed: () {
                  controller.login(email:email.text , password: password.text);


                  // Get.offAllNamed("NavigationMenu");
                },
                child: const Text("Sign In"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: CColors.primary,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Or sign In  with',
                  style: CTextStyles.textStyle16.copyWith(color: CColors.darkGrey),
                ),
                Container(
                  width: 100,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: CColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
            SizedBox(
              height: 32,
              width: 144,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(onTap:(){},icon: FontAwesomeIcons.apple),
                  const SizedBox(
                    width: 14,
                  ),
                  SocialButton(onTap:(){},icon: FontAwesomeIcons.google),
                  const SizedBox(
                    width: 14,
                  ),
                  SocialButton(onTap:(){},icon: FontAwesomeIcons.facebook),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: CTextStyles.textStyle16.copyWith(color: CColors.darkGrey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, 'CreateAccountScreen');
                  },
                  child:  Text(
                    'sign up',
                    style: CTextStyles.textStyle16.copyWith(color: CColors.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
