import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CStadiumTextField extends StatelessWidget {
  const CStadiumTextField(
      {super.key,
      this.icon,
      required this.hintText,
      this.readOnly = false,
      this.onTap,
      this.suffixIcon,
      this.padding,
      this.controller,
      this.onTapLeading,
      this.onTapTrailing,
      this.title,
      this.validator,
      this.centerHint = false,
      this.keyboardType});
  final Widget? icon;
  final bool readOnly;
  final bool centerHint;
  final String hintText;
  final String? title;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final VoidCallback? onTapLeading;
  final VoidCallback? onTapTrailing;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.only(
            right: CSizes.defaultSpace,
            left: CSizes.defaultSpace,
            bottom: CSizes.spaceBtwItems,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
              child: Text(title!, style: CTextStyles.textStyle20),
            ),
          TextFormField(
            onTap: onTap,
            readOnly: readOnly,
            controller: controller,
            validator: validator,
            textAlign: centerHint ? TextAlign.center : TextAlign.start,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: icon != null
                  ? (onTapLeading != null)
                      ? IconButton(
                          onPressed: onTapLeading,
                          icon: icon!,
                          splashRadius: CSizes.splashRadius,
                        )
                      : icon
                  : null,
              suffixIcon: suffixIcon != null
                  ? (onTapTrailing != null)
                      ? IconButton(
                          onPressed: onTapTrailing,
                          icon: suffixIcon!,
                          splashRadius: CSizes.splashRadius,
                        )
                      : suffixIcon
                  : null,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffEDEBEB)),
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CColors.primary,width: 2),
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ) ,
              hintText: hintText,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
