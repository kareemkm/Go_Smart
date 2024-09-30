import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/dialogs/main_alert_dialog.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class COfflineAlertDialog extends StatelessWidget {
  const COfflineAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CAlertDialog(
      //? dialog body text
      showCloseButton: false,
      body: const Text(
        "You're currently unavailable. Tap 'Go Online' to receive ride requests.",
        textAlign: TextAlign.center,
      ),
      trailing: Column(children: [
        const Divider(
          thickness: 1,
          height: 0,
        ),
        //? actions
        SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Cancel",
                      style: CTextStyles.textStyle16
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                width: 1,
                color: CColors.darkGrey,
                margin: const EdgeInsets.symmetric(horizontal: CSizes.sm),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: CTextStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.w600, color: CColors.primary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
