import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class CWalletCard extends StatelessWidget {
  const CWalletCard({super.key, this.width, this.empty = true, this.balance, this.margin});
  final double? width;
  final bool empty;
  final String? balance;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: width,
      margin: margin,
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              offset: const Offset(0,-2),
              blurRadius: 10,
            )
          ]),
      child: empty
          ? null
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Row(
                    children: [
                      const CCircularContainer(
                        color: CColors.primary,
                        height: 50,
                        width: 50,
                        child: Icon(
                          Iconsax.wallet_2,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: CSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "My Wallet",
                            style: CTextStyles.textStyle17,
                          ),
                          Text(
                            "Default Payment Method",
                            style: CTextStyles.textStyle17
                                .copyWith(color: CColors.darkGrey),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BALANCE",
                        style: CTextStyles.textStyle13
                            .copyWith(color: CColors.darkGrey),
                      ),
                      Text(balance??"",
                          style: CTextStyles.textStyle30
                              .copyWith(color: CColors.primary))
                    ],
                  )
                ]),
    );
  }
}
