import 'package:flutter/material.dart';
import 'package:go_smart/common/widgets/containers/rounded_container.dart';
import 'package:go_smart/features/authentication/screens/complete_your_profile/widgets/dropdown.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/helpers/generator.dart';

class CPhoneNumberTextField extends StatelessWidget {
  const CPhoneNumberTextField({super.key, this.selectedValue, required this.onChandge, this.controller});
  final String? selectedValue;
  final TextEditingController? controller;
  final void Function(String?) onChandge;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "phone number",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        CRoundedContainer(
          width: double.infinity,
          height: 60,
          radius: 12,
          child: Row(
            children: [
              SizedBox(
                width: 80,
                child: CDropDownMenu(
                  onChandge: onChandge,
                  selectedValue: selectedValue,
                  hintText: "+1",
                  items: CGenerator.getPhoneCodes(),
                ),
              ),
              Container(
                height: 40,
                width: 1,
                color: CColors.darkGrey,
                margin: const EdgeInsets.only(right: 10),
              ),
              Expanded(
                child: TextFormField(
                  controller:controller ,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Enter phone number"),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }
}
