import 'package:flutter/material.dart';
import 'package:go_smart/features/payment/screens/my_wallet/widgets/wallet_card.dart';

class CStackedWallets extends StatelessWidget {
  const CStackedWallets({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 235,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: Center(
              child: CWalletCard(
                margin: EdgeInsets.symmetric(horizontal: 30),
              ),
            ),
          ),
          Positioned(
            // alignment: Alignment.bottomCenter,
            bottom: 15,
            right: 0,
            left: 0,
            child: Center(
              child: CWalletCard(
                margin: EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CWalletCard(balance: "\$2500", empty: false),
          ),
        ],
      ),
    );
  }
}
