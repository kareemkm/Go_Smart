import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/features/planing/shared/widgets/review_selection_tab_body.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import '../../controllers/define_a_plan/define_a_plan_controller.dart';

class ReviewSelection extends StatelessWidget {
  const ReviewSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DefineAPlanController>(
       init: DefineAPlanController(),
      builder:(controller) =>  DefaultTabController(
        length: controller.recommendationAi.recommendations?.length ?? 1,
        child: Column(
          children: [
            const Text("Review of your selected plan",style: CTextStyles.textStyle16,textAlign: TextAlign.center,),
            const SizedBox(height: CSizes.spaceBtwItems),
            TabBar(
                labelStyle: CTextStyles.textStyle14.copyWith(color: Colors.black),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: CColors.darkGrey,
                indicatorColor: Colors.black,
                indicatorWeight: 3,
                tabs:List.generate(controller.recommendationAi.recommendations?.length ?? 1,
                    (index) {
                      return Tab(child: Text('day ${controller.recommendationAi.recommendations?[index].day}'),);
                    },),),
             Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: CSizes.sm),
                child: TabBarView(children:List.generate(controller.recommendationAi.recommendations?.length ?? 1,
                      (index) {
                  for(int i = 0 ; i <= index; i++) {
                    return ReviewSelectionTapBody(model:controller.recommendationAi.recommendations?[index] ,);
                  }
                  return ReviewSelectionTapBody();
                  },),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

