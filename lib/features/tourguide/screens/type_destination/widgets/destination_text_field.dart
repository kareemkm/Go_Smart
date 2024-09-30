import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';

class DestinationTextField extends StatefulWidget {
  const DestinationTextField(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;

  @override
  State<DestinationTextField> createState() => _DestinationTextFieldState();
}

class _DestinationTextFieldState extends State<DestinationTextField> {
  bool showClearBtn = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: (value) {
        if (value.isNotEmpty) {
          showClearBtn = true;
        } else {
          showClearBtn = false;
        }
        setState(() {});
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please type your destination";
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        hintText: widget.hintText,
        filled: true,
        fillColor: CColors.white,
        contentPadding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 20),
        suffixIcon: showClearBtn
            ? GestureDetector(
                onTap: () {
                  widget.controller.clear();
                  setState(() {
                    showClearBtn = false;
                  });
                },
                child: const Icon(Icons.cancel_rounded),
              )
            : null,
        suffixIconColor: CColors.darkGrey,
        hintStyle: CTextStyles.textStyle17.copyWith(color: Colors.black),
      ),
    );
  }
}
