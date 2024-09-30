import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/containers/rounded_container.dart';
import 'package:go_smart/features/payment/screens/success_credit_card_payment/widgets/dashed_line.dart';
import 'package:go_smart/features/payment/screens/success_credit_card_payment/widgets/small_white_master_card.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import 'payment_details.dart';

class BuildTicket extends StatelessWidget {
  const BuildTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 0,
      left: 0,
      child: CRoundedContainer(
        height: 640,
        // width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
        radius: CSizes.cardRadiusLg,
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              //? thanks and success texts
              const SizedBox(height: CSizes.spaceBtwItems + 50),
              const Text("Thank you!", style: CTextStyles.textStyle24),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                "Your transaction was successful",
                style: CTextStyles.textStyle20.copyWith(
                  fontWeight: FontWeight.normal,
                  color: CColors.darkerGrey,
                ),
              ),
              const SizedBox(height: CSizes.spaceBtwSections),

              //? details
              const CPaymentDetails(
                date: "01/24/2023",
                time: "10:15 AM",
                to: "Sam Louis",
              ),

              //? divider
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: CSizes.spaceBtwSections,
                ),
                child: Divider(
                  height: 0,
                  thickness: 2,
                ),
              ),
              //? total price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",
                      style: CTextStyles.textStyle24
                          .copyWith(fontWeight: FontWeight.w600)),
                  Text(
                    "\$80.00",
                    style: CTextStyles.textStyle20
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwItems),

              //? small master card
              SmallWhiteMasterCard(
                icon: SvgPicture.asset(CImages.masterCardPay),
                lastTwoDigits: 78,
              ),

              //? custom dashed line
              const Padding(
                padding: EdgeInsets.only(
                    top: CSizes.spaceBtwItems,
                    bottom: CSizes.spaceBtwSections * 1.4),
                child: CDashedLine(),
              ),

              //? barcode and button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(CImages.barcode),
                  CRoundedContainer(
                    enableBorder: true,
                    borderColor: CColors.primary,
                    borderWidth: 2,
                    height: 58,
                    radius: CSizes.cardRadiusLg,
                    child: Text(
                      "PAID",
                      style: CTextStyles.textStyle24
                          .copyWith(color: CColors.primary),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
