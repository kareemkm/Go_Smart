import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';

class CTextFieldWithTitle extends StatefulWidget {
  const CTextFieldWithTitle({
    super.key,
    required this.hintText,
    required this.title,
    this.obSecure = false, this.maxLines = 1,
    this.controller
  });
  final String hintText;
  final String title;
  final bool obSecure;
  final int maxLines;
  final TextEditingController? controller;
  @override
  State<CTextFieldWithTitle> createState() =>
      _CTextFieldWithTitleState();
}

class _CTextFieldWithTitleState extends State<CTextFieldWithTitle> {
  late bool isHidden;
  @override
  void initState() {
    isHidden = widget.obSecure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            widget.title,
            style: CTextStyles.textStyle16,
          ),
        ),
        TextField(
          controller: widget.controller,
          obscureText: isHidden,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF0EFEF),
            suffixIcon: toggleVisibility(),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }

  Widget? toggleVisibility() {
    if (widget.obSecure) {
      return GestureDetector(
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
        child: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
      );
    }
    return null;
  }
}
