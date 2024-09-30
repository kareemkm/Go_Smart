import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';

class PlanSelectDurationRadioButtons extends StatefulWidget {
  const PlanSelectDurationRadioButtons({super.key});

  @override
  State<PlanSelectDurationRadioButtons> createState() =>
      _PlanSelectDurationRadioButtonsState();
}

class _PlanSelectDurationRadioButtonsState
    extends State<PlanSelectDurationRadioButtons> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio(
                value: 0,
                groupValue: selectedValue,
                onChanged: (_) {
                  setState(() {
                    selectedValue = 0;
                  });
                }),
            const Text(
              "3 - 6 hours",
              style: CTextStyles.textStyle16,
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 1,
                groupValue: selectedValue,
                onChanged: (_) {
                  setState(() {
                    selectedValue = 1;
                  });
                }),
            const Text(
              "Mid-day",
              style: CTextStyles.textStyle16,
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 2,
                groupValue: selectedValue,
                onChanged: (_) {
                  setState(() {
                    selectedValue = 2;
                  });
                }),
            const Text(
              "Full - day",
              style: CTextStyles.textStyle16,
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 3,
                groupValue: selectedValue,
                onChanged: (_) {
                  setState(() {
                    selectedValue = 3;
                  });
                }),
            const Text(
              "More 1 day",
              style: CTextStyles.textStyle16,
            )
          ],
        ),
      ],
    );
  }
}
