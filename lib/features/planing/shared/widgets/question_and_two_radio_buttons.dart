import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CQuestionWithTwoRadioButtons extends StatefulWidget {
  const CQuestionWithTwoRadioButtons({
    super.key,
    required this.question,
    required this.onYesSelected,
    required this.onNoSelected,
    this.textAlign = TextAlign.center,
    this.onTap,
  });
  final String question;
  final VoidCallback onYesSelected;
  final VoidCallback onNoSelected;
  final VoidCallback? onTap;
  final TextAlign textAlign;

  @override
  State<CQuestionWithTwoRadioButtons> createState() =>
      _CQuestionWithTwoRadioButtonsState();
}

class _CQuestionWithTwoRadioButtonsState
    extends State<CQuestionWithTwoRadioButtons> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.question,
          style: CTextStyles.textStyle16,
          textAlign: widget.textAlign,
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Radio(
                    value: 1,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        setState(() {
                          selectedValue = 1;
                        });
                      });
                      widget.onYesSelected();
                    }),
                const Text("Yes"),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 0,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                          selectedValue = 0;
                      });
                      widget.onNoSelected();
                    }),
                const Text("No"),
              ],
            )
          ],
        ),
      ],
    );
  }
}
