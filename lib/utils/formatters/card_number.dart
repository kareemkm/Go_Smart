import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final trimmed = newValue.text.replaceAll(RegExp(r'\s'), '');
    String formatted = '';

    for (int i = 0; i < trimmed.length; i += 4) {
      final end = i + 4;
      if (end < trimmed.length) {
        formatted += '${trimmed.substring(i, end)}  ';
      } else {
        formatted += trimmed.substring(i);
      }
    }

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
