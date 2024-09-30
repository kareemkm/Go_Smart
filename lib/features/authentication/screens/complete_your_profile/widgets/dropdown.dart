import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';

class CDropDownMenu extends StatefulWidget {
  const CDropDownMenu({super.key, required this.items, required this.hintText, this.selectedValue, required this.onChandge});
  final List<String> items;
  final String hintText;
  final String? selectedValue;
  final void Function(String?) onChandge;

  @override
  State<CDropDownMenu> createState() => _CDropDownMenuState();
}

class _CDropDownMenuState extends State<CDropDownMenu> {


  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                widget.hintText,
                style: CTextStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                  color: CColors.darkGrey,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: widget.items
            .map(
              (String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: CTextStyles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
        value: widget.selectedValue,

        onChanged:
          widget.onChandge
        ,
        buttonStyleData: const ButtonStyleData(
          width: 180,
          padding: EdgeInsets.symmetric(horizontal: 14),
          elevation: 0,
        ),
        iconStyleData:
            const IconStyleData(icon: Icon(Icons.keyboard_arrow_down_rounded)),
      ),
    );
  }
}
