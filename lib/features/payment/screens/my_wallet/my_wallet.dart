import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/text_fields/text_field_with_title.dart';
import 'package:go_smart/features/payment/screens/my_wallet/widgets/stacked_wallets.dart';
import 'package:go_smart/features/payment/screens/success_wallet_payment/success_wallet_payment.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(title: "My Wallet"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? wallets stacked behind each others
              const CStackedWallets(),
              const SizedBox(height: CSizes.spaceBtwSections),
              Wrap(
                alignment: WrapAlignment.start,
                children: [
                  const Text(
                    "just a reminder that the",
                    style: CTextStyles.textStyle14,
                  ),
                  Text(
                    " \$80 ",
                    style: CTextStyles.textStyle14.copyWith(
                        color: CColors.primary, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "payment is due to finalize your booking",
                    style: CTextStyles.textStyle14,
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwSections),

              //? password section
              const CTextFieldWithTitle(
                hintText: "**********",
                title: "Please enter your password",
                obSecure: true,
              ),
              const SizedBox(height: CSizes.spaceBtwSections * 3),
              CElevatedButton(
                onPressed: () {
                  Get.offAll(() => const SuccessWalletPaymentScreen(),arguments: {"type" : Get.arguments['type']});
                },
                width: double.infinity,
                child: const Text("Confirm Payment"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
