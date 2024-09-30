import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';

abstract class CCheckBoxTheme {
  /* -- Light Theme -- */
  static final lightCheckBoxTheme = CheckboxThemeData(
    fillColor: MaterialStateColor.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return CColors.primary;
        }
        return CColors.white;
      },
    ),
  );
}
