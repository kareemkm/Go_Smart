import 'package:flutter/material.dart';
import 'package:go_smart/common/widgets/containers/rounded_container.dart';
import 'package:go_smart/features/authentication/screens/complete_your_profile/widgets/dropdown.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:go_smart/utils/helpers/generator.dart';

class CBirthDateDropDowns extends StatelessWidget {
  const CBirthDateDropDowns({super.key, this.selectedValueDay, required this.onChandgeDay, this.selectedValuemonth, required this.onChandgemonth, this.selectedValueyear, required this.onChandgeyear,});
  final String? selectedValueDay;
  final void Function(String?) onChandgeDay;
  final String? selectedValuemonth;
  final void Function(String?) onChandgemonth;
  final String? selectedValueyear;
  final void Function(String?) onChandgeyear;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          "Birth Date",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CRoundedContainer(
              radius: 12,
              height: 60,
              child: CDropDownMenu(
                onChandge: onChandgeDay,
                selectedValue: selectedValueDay,
                items: CGenerator.getDays(),
                hintText: "Day",
                // width: 200,
              ),
            ),
          ),
          const SizedBox(width: CSizes.sm),
          Expanded(
            child: CRoundedContainer(
              radius: 12,
              height: 60,
              child: CDropDownMenu(
                onChandge: onChandgemonth,
                selectedValue: selectedValuemonth,

                items: CGenerator.getMonths(),
                hintText: "month",
              ),
            ),
          ),
          const SizedBox(width: CSizes.sm),
          Expanded(
            child: CRoundedContainer(
              radius: 12,
              height: 60,
              child: CDropDownMenu(
                onChandge: onChandgeyear,
                selectedValue: selectedValueyear,

                items: CGenerator.getYears(1950),
                hintText: "year",
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
