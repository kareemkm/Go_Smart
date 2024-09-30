import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/theme/custom_themes/check_box_theme.dart';
import 'package:go_smart/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:go_smart/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:go_smart/utils/theme/custom_themes/radio_button_theme.dart';

abstract class CAppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    fontFamily: "Urbanist",
    brightness: Brightness.light,
    primaryColor: CColors.primary,
    disabledColor: CColors.grey,
    scaffoldBackgroundColor: Colors.white,
    // textTheme: CTextTheme.lightTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,
    radioTheme: CRadioButtonTheme.lightRadioButtonTheme,
    checkboxTheme: CCheckBoxTheme.lightCheckBoxTheme
  );
  // static ThemeData darkTheme = ThemeData(
  //   fontFamily: "Poppins",
  //   brightness: Brightness.dark,
  //   useMaterial3: false,
  //   primaryColor: CColors.primary,
  //   disabledColor: CColors.grey,
  //   scaffoldBackgroundColor: CColors.dark,
  //   textTheme: CTextTheme.darkTextTheme,
  //   elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
  //   outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,
  // );
}
