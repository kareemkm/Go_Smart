import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';

abstract class CRadioButtonTheme {
  /* -- Light Theme -- */
  static final lightRadioButtonTheme = RadioThemeData(
    fillColor: MaterialStateColor.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return CColors.primary;
        }
        return Colors.black;
      },
    ),
  );
}
