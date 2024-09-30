import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/features/authentication/screens/signup/create_account.dart';
import 'package:go_smart/features/authentication/screens/login/login.dart';
import 'package:go_smart/features/authentication/screens/welcome/welcome.dart';
import 'package:go_smart/navigation_menu.dart';
import 'package:go_smart/splash_screen.dart';
import 'package:go_smart/utils/theme/app_theme.dart';


void main() {
  runApp(const GoSmart());
}
class GoSmart extends StatelessWidget {
  const GoSmart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'WelcomeScreen': (context) => const WelcomeScreen(),
        'CreateAccountScreen': (context) => const CreateAccountScreen(),
        'SignInScreen':(context) => const LoginScreen(),
        'NavigationMenu' :(context) => const NavigationMenu()
      },
      theme: CAppTheme.lightTheme,
      home:const  SplashScreen(),
    );
  }
}
