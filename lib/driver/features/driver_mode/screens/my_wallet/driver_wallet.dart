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

class DriverWalletScreen extends StatelessWidget {
  const DriverWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CAppBar(title: "My Wallet"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? wallets stacked behind each others
              CStackedWallets(),
            ],
          ),
        ),
      ),
    );
  }
}
