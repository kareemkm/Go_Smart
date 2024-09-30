import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/dialogs/main_alert_dialog.dart';
import 'package:go_smart/driver/features/driver_mode/controller/driver_controller.dart';
import 'package:go_smart/features/payment/screens/payment_method/payment_method.dart';
import 'package:go_smart/features/payment/screens/webview/webview.dart';
import 'package:go_smart/features/tourguide/screens/confirm_booking/widgets/success_booking_dialog.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:go_smart/utils/enums/payment_in.dart';

class ConfirmBookingDialog extends StatelessWidget {
  const ConfirmBookingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder:(controller) =>  CAlertDialog(
        //? dialog body text
        body: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: CTextStyles.textStyle16.copyWith(color: Colors.black),
            children: <TextSpan>[
              const TextSpan(text: 'The total cost for service is '),
              TextSpan(
                text: '\$25',
                style:CTextStyles.textStyle20.copyWith(
                  color: CColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const TextSpan(text: '.\nPlease complete your payment to continue'),
            ],
          ),
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
                    onTap: (){
                      Navigator.pop(context);
                      showDialog(context: context, builder: (context)=> const SuccessBookingDialog());
                    } ,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Cash",
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
                    onTap: ()async{
                      await controller.payments();
                      Get.to(() => web(url: controller.payment.url ?? ''));
                    },
                    child: Center(
                      child: Text(
                        "Pay Now",
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
      ),
    );
  }
}
