import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/cards/plan_card.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import '../../../../../utils/constants/const.dart';
import '../../../controllers/plan_a_trip/plan_a_trip_controller.dart';

class StepOneBody extends StatelessWidget {
  const StepOneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanATripController>(
      init: PlanATripController(),
      builder:(controller) =>  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Where to stay?",
              style:
                  CTextStyles.textStyle20.copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(height: CSizes.spaceBtwItems),
          Text("mix of charming and modern hotels",
              style: CTextStyles.textStyle14.copyWith(color: CColors.primary)),
          const SizedBox(height: CSizes.spaceBtwItems),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  recommendation.hotel?.data?.length ?? 0,
                  (index) =>  CPlanCard(
                    margin: EdgeInsets.only(bottom: 10),
                    title:recommendation.hotel?.data?[index].hotelName ?? '',
                    review: "(22 Review)",
                    image: CImages.hotel1,
                    onTap:() {
                      controller.ChangeSelect(index);
                    } ,
                    isSelected: controller.isSelect == index ? true : false,
                    price: "Start from 20\$",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
