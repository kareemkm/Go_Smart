import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/dialogs/main_alert_dialog.dart';
import 'package:go_smart/common/widgets/text_fields/stadium_text_field.dart';
import 'package:go_smart/driver/features/driver_mode/controller/driver_controller.dart';
import 'package:go_smart/features/payment/screens/payment_method/payment_method.dart';
import 'package:go_smart/features/planing/screens/confirm_booking/widgets/plan_select_duration.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:go_smart/utils/enums/payment_in.dart';
import 'package:go_smart/utils/helpers/helper_functions.dart';

import '../../../payment/screens/webview/webview.dart';

class TourGuidesPlanConfirmBookingScreen extends StatelessWidget {
  const TourGuidesPlanConfirmBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder:(controller) =>  Scaffold(
        appBar: const CAppBar(
          title: "Pre-Booking",
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? select date
              CStadiumTextField(
                icon: const Icon(Icons.calendar_month),
                hintText: "DD/MM/YY",
                title: " select Date",
                readOnly: true,
                onTap: () async {
                  CHelperFunctions.pickDate(context: context);
                },
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: CSizes.spaceBtwItems),
                child: Text(
                  " select your duration",
                  style: CTextStyles.textStyle20,
                ),
              ),

              //? select duration section
              const PlanSelectDurationRadioButtons(),
              const SizedBox(height: CSizes.spaceBtwItems),

              //? location
              const CStadiumTextField(
                icon: Icon(Icons.location_on_outlined),
                hintText: "location",
                title: " select your Start point",
              ),
              //? Elevated button
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSections),
                child: CElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CAlertDialog(
                        trailing: CElevatedButton(
                          onPressed: () async{
                            await controller.payments();
                            Get.to(() => web(url: controller.payment.url ?? ''));
                          },
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                                  horizontal: CSizes.defaultSpace)
                              .copyWith(bottom: CSizes.defaultSpace),
                          child: const Text("Pay \$50"),
                        ),
                        content:
                            "The total cost for service is \$50. Please complete your payment to continue",
                      ),
                    );
                  },
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
                  child: const Text("Check availability"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
