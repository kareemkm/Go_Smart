import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/cards/detail_card.dart';
import 'package:go_smart/common/widgets/section_headline.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import '../../model/recomandition_model.dart';

class ReviewSelectionTapBody extends StatelessWidget {
   ReviewSelectionTapBody({super.key,this.model});
  Recommendation? model ;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //? hotels
        const Padding(
          padding: EdgeInsets.symmetric(vertical: CSizes.spaceBtwItems),
          child: Text("Hotel", style: CTextStyles.textStyle16),
        ),
         CDetailCard(
          title: model?.hotel ?? '',
          subtitle: 'Alexandria',
          review: "(13 Review)",
          image: CImages.hotel5,
          additionalText: "320\$ per night",
          rating: "4.2",
          margin: EdgeInsets.only(bottom: CSizes.defaultSpace),
        ),

        //? restaurants
        const Text("Restaurants", style: CTextStyles.textStyle16),
        const SizedBox(height: CSizes.spaceBtwItems),
          CDetailCard(
            title: model?.restaurant ?? '',
            subtitle: 'Alexandria',
            review: "(13 Review)",
            image: CImages.food2,
            additionalText: "Egyptian food",
            rating: "4.2",
            margin: EdgeInsets.only(bottom: CSizes.defaultSpace),
          ),


        //? places to visit
        CustomSectionHeadline(headText: "Places to visit" , onTap: (){}, seeAll: "See all"),
        const SizedBox(height: CSizes.spaceBtwItems),
         CDetailCard(
          title:model?.place ?? '',
          subtitle: 'Alexandria',
          review: "(13 Review)",
          image: CImages.city1,
          isSaved: true,
          margin: EdgeInsets.only(bottom: CSizes.defaultSpace),
        ),
      ]),
    );
  }
}
