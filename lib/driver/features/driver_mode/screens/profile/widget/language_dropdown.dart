import 'package:flutter/material.dart';
import 'package:go_smart/common/widgets/containers/rounded_container.dart';
import 'package:go_smart/features/authentication/screens/complete_your_profile/widgets/dropdown.dart';


class CLanguageDropDown extends StatelessWidget {
  const CLanguageDropDown({super.key,  this.hint,  required this.item, required this.Title, this.selectedValue, required this.onChandge});
  final String? hint;
  final String Title;
  final List<String> item;
  final String? selectedValue;
  final void Function(String?) onChandge;


  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
          Title ,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        CRoundedContainer(
          width: double.infinity,
          height: 60,
          radius: 12,
          child: SizedBox(
            width: double.infinity,
            child: CDropDownMenu(
              onChandge:onChandge ,
              selectedValue:selectedValue ,
              hintText: hint ?? '',
              items: item,
            ),
          ),
        ),
      ],
    );
  }
}
