import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/driver/features/driver_mode/controller/driver_controller.dart';
import 'package:go_smart/features/planing/controllers/define_a_plan/define_a_plan_controller.dart';
import 'package:go_smart/features/planing/shared/widgets/question_and_two_radio_buttons.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class StepThreeBody extends StatefulWidget {
  const StepThreeBody({super.key});

  @override
  State<StepThreeBody> createState() => _StepThreeBodyState();
}

class _StepThreeBodyState extends State<StepThreeBody> {
  @override
  Widget build(BuildContext context) {
    DefineAPlanController controller = Get.find<DefineAPlanController>();
    List<String> texts = [
      "Deeper Insights",
      "Personalized Journey",
      "Safety and Confidence",
      "Hidden Gems and Local Delights"
    ];
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder:(controlle) =>  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CQuestionWithTwoRadioButtons(
            question: "Would you be interested in adding a personalized tour guide to your trip?",
            onYesSelected: () async{
              await controlle.getAllDriver('Alexandria');

              controller.withTourguide = true;
              controller.reload();
            },
            onNoSelected: () {
              controller.withTourguide= false;
              controller.reload();
            },
          ),
          const SizedBox(height: CSizes.spaceBtwSections),
          const Text(
            "how your travel experience thrives\nwith a tour guide?",
            style: CTextStyles.textStyle16,
          ),
          const SizedBox(height: CSizes.spaceBtwSections),
          ...List.generate(
            4,
            (i) => Padding(
              padding: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
              child: Text(
                "${i + 1}. ${texts[i]}",
                style: CTextStyles.textStyle16.copyWith(color: CColors.primary),
              ),
            ),
          ),
          const SizedBox(height: CSizes.spaceBtwItems),
          Text(
            "This is Additional service!",
            style: CTextStyles.textStyle14.copyWith(
              color: Colors.black.withOpacity(.4),
            ),
          )
        ],
      ),
    );
  }
}
