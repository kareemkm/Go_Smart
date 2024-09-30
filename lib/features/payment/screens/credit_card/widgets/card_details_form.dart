import 'package:flutter/material.dart';
import 'package:go_smart/features/payment/screens/credit_card/widgets/underline_text_field.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CCardDetailsForm extends StatelessWidget {
  const CCardDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: [
          CUnderLineTextFieldWithTitle(
            title: "Card Number",
            enableFormatter: true,
            hintText: "1234 5678 1234 5678",
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: CSizes.spaceBtwSections),
          Row(
            children: [
              Expanded(
                child: CUnderLineTextFieldWithTitle(
                  title: "Name",
                  hintText: "Sam Louis",
                ),
              ),
              SizedBox(width: CSizes.spaceBtwInputFields),
              Expanded(
                child: CUnderLineTextFieldWithTitle(
                  title: "Card ID",
                  hintText: "Mastercard",
                ),
              ),
            ],
          ),
          SizedBox(height: CSizes.spaceBtwSections),
          Row(
            children: [
              Expanded(
                child: CUnderLineTextFieldWithTitle(
                  title: "Expiration Date",
                  hintText: "07/29",
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(width: CSizes.spaceBtwInputFields),
              Expanded(
                child: CUnderLineTextFieldWithTitle(
                  title: "CVV",
                  hintText: "215",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
