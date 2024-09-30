import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/cards/tourguide_card.dart';
import 'package:go_smart/common/widgets/dialogs/main_alert_dialog.dart';
import 'package:go_smart/driver/features/model/all_driver_model.dart';
import 'package:go_smart/features/planing/shared/widgets/plan_steps_row.dart';
import 'package:go_smart/features/tourguide/screens/tourguide_profile/tourguide_profile.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class BasedOnYourSelectedScreen extends StatelessWidget {
  const BasedOnYourSelectedScreen(
      {super.key, required this.action, this.title = "Based on your selected", this.model});
  final Widget action;
  final String title;
  final List<Datum>? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CAppBar(
        title: "Plan ${model?[0].city}",
      ),
      body: Column(
        children: [
          //? duration and date
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "3 Days\t",
                style: CTextStyles.textStyle14.copyWith(
                  color: CColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: CSizes.sm),
              Text(
                "01 May to 03",
                style: CTextStyles.textStyle14.copyWith(
                  color: CColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const PlanStepsRow(
                    currentStep: 2,
                    length: 2,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  Text(
                    title,
                    style: CTextStyles.textStyle16,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections),
                  ListView.builder(
                    itemCount: model?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CTourGuideCard(
                      title: model?[index].name ?? '',
                      subtitle: model?[index].city ?? '',
                      review: "(13 Review)",
                      price: "15\$ per hour",
                      image: model?[index].image ?? '',
                      isNetworkImage: true,
                      rating: "4.2",
                      onTapViewProfile: () {
                        Get.to(TourguideProfileScreen(
                          image: CImages.tourguide2,
                          onTapBookNow: () {
                            showDialog(
                              context: context,
                              builder: (context) => CAlertDialog(
                                showCloseButton: false,
                                trailing: CElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                    Get.back();
                                  },
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                          horizontal: CSizes.defaultSpace)
                                      .copyWith(bottom: CSizes.defaultSpace),
                                  child: const Text("OK"),
                                ),
                                content: "You Have Already Booked",
                              ),
                            );
                          },
                        ));
                      },
                      margin:
                          const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
                    ),
                  ),),
                  const SizedBox(height: CSizes.spaceBtwSections * 4),
                  action,
                  const SizedBox(height: CSizes.spaceBtwItems,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
