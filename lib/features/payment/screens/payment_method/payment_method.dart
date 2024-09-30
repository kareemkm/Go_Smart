import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/list_tiles/list_tile.dart';
import 'package:go_smart/features/payment/screens/credit_card/credit_card.dart';
import 'package:go_smart/features/payment/screens/my_wallet/my_wallet.dart';
import 'package:go_smart/utils/enums/payment_in.dart';
import 'package:iconsax/iconsax.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key, required this.type});
  final PaymentUsedIn type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        title: "Payment Method",
      ),
      body: Column(children: [
        CListTile(
          onTap: () {
            Get.to(() => const MyWalletScreen(),arguments: {"type" : type});
          },
          title: "My wallet",
          icon: Iconsax.wallet_2,
        ),
        CListTile(
          onTap: () {
            Get.to(() => const CreditCardScreen(),arguments: {"type" : type});
          },
          title: "Credit Card",
          icon: FontAwesomeIcons.creditCard,
        ),
      ]),
    );
  }
}
