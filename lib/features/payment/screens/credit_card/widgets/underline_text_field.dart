import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/formatters/card_number.dart';

class CUnderLineTextFieldWithTitle extends StatelessWidget {
  const CUnderLineTextFieldWithTitle({super.key,required this.title ,this.enableFormatter = false, this.hintText, this.keyboardType, this.controller});
  final bool enableFormatter;
  final String title;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CTextStyles.textStyle18,
        ),
        TextFormField(
          inputFormatters: enableFormatter
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                  CardNumberFormatter() //? make space between each 4 that numbers we write
                ]
              : null,
          keyboardType: keyboardType,
          style: CTextStyles.textStyle18.copyWith(fontWeight: FontWeight.w600),
          decoration:  InputDecoration(
            hintText: hintText 
          ),
        )
      ],
    );
  }
}
