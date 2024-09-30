import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/cards/plan_card.dart';
import 'package:go_smart/common/widgets/section_headline.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import '../../../../../utils/constants/const.dart';
import '../../../controllers/plan_a_trip/plan_a_trip_controller.dart';

class StepTwoBody extends StatelessWidget {
  const StepTwoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanATripController>(
      init: PlanATripController(),
      builder:(controller) =>  DefaultTabController(
        length: recommendation.hotel?.data?.length ?? 1,
        child: Column(
          children: [
            TabBar(
                labelStyle: CTextStyles.textStyle14.copyWith(color: Colors.black),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: CColors.darkGrey,
                indicatorColor: Colors.black,
                isScrollable: true,
                indicatorWeight: recommendation.hotel?.data?.length.toDouble() ?? 1,
                tabs: List.generate(recommendation.hotel?.data?.length ?? 1,
                      (index) {
                    return Tab(child: Text('day ${recommendation.hotel?.data?[index].plan}'),);
                  },),),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: CSizes.sm),
                child: TabBarView(children: [
                  TabBody(),
                  TabBody(),
                  TabBody(),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TabBody extends StatelessWidget {
  const TabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanATripController>(
      init: PlanATripController(),
      builder:(controller) =>  SingleChildScrollView(
        child: Column(children: [
          CustomSectionHeadline(
            headText: "Restaurants",
            onTap: () {},
            seeAll: "See All",
          ),
           SizedBox(height: CSizes.spaceBtwItems),
          ...List.generate(
          recommendation.hotel?.data?.length ?? 1,
            (index) =>  CPlanCard(
              title: recommendation.hotel?.data?[index].restaurant?.restaurantdata?.resturantName ?? '',
              review: "(50 Review)",
              image:recommendation.hotel?.data?[index].restaurant?.restaurantdata?.image ?? '',
              isSelected: true,
              isNetworkImage: true,
              price: "Start from 20\$",
              margin: EdgeInsets.only(bottom: CSizes.spaceBtwItems),
            ),
          ),
          CustomSectionHeadline(
            headText: "Places to visit",
            onTap: () {},
            seeAll: "See All",
          ),
          const SizedBox(height: CSizes.spaceBtwItems),
          ...List.generate(
   recommendation.hotel?.data?.length ?? 1,
            (index) =>  CPlanCard(
              title: recommendation.hotel?.data?[index].landMark?.landmarkdata?.landmarkName ?? '',
              review: "(50 Review)",
              image: recommendation.hotel?.data?[index].landMark?.landmarkdata?.image ?? '',
              isSelected: true,
              isNetworkImage: true,
              margin: EdgeInsets.only(bottom: CSizes.spaceBtwItems),
            ),
          )
        ]),
      ),
    );
  }
}
