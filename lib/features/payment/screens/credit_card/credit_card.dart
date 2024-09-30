import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/features/payment/screens/credit_card/widgets/card_details_form.dart';
import 'package:go_smart/features/payment/screens/credit_card/widgets/carousel_slider.dart';
import 'package:go_smart/features/payment/screens/credit_card/widgets/payment_way_card.dart';
import 'package:go_smart/features/payment/screens/success_credit_card_payment/success_credit_card_payment.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CreditCardScreen extends StatelessWidget {
  const CreditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(title: "Credit Card"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(children: [
            //? payment ways
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CPaymentWayCard(
                  onTap: () {},
                  image: CImages.creditCardPay,
                  isSelected: true,
                ),
                CPaymentWayCard(onTap: () {}, image: CImages.payPalPay),
                CPaymentWayCard(onTap: () {}, image: CImages.masterCardPay)
              ],
            ),
            
            //? slider
             const CCarouselSlider(),

            //? form 
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                right: CSizes.defaultSpace * 2,
                top: CSizes.spaceBtwItems,
                bottom: CSizes.spaceBtwSections,
              ),
              child: const CCardDetailsForm(),
            ),
            CElevatedButton(
              onPressed: () {
                Get.to(() => const SuccessCreditCardPayment(),arguments: {"type" : Get.arguments['type']});
              },
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: CSizes.sm),
              child: const Text("Confirm Payment"),
            )
          ]),
        ),
      ),
    );
  }
}
