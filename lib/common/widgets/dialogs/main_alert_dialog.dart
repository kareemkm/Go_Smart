import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CAlertDialog extends StatelessWidget {
  const CAlertDialog(
      {super.key, this.content, required this.trailing, this.body,this.showCloseButton = true});
  final String? content;
  final Widget? body;
  final Widget trailing;
  final bool showCloseButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      actions: [trailing],
      actionsPadding: EdgeInsets.zero,
      content: Stack(children: [
        Column(mainAxisSize: MainAxisSize.min, children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline, color: CColors.primary),
            ],
          ),
          const SizedBox(height: CSizes.spaceBtwSections),
          content != null
              ? Text(
                  content!,
                  textAlign: TextAlign.center,
                  style: CTextStyles.textStyle16,
                )
              : body ?? const SizedBox(),
          const SizedBox(height: CSizes.spaceBtwSections),
        ]),
        if(showCloseButton) Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.close, color: CColors.primary),
          ),
        )
      ]),
    );
  }
}
