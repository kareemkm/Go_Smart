
import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/cards/detail_card.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class TabBody extends StatelessWidget {
  const TabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //? hotels
        const Padding(
          padding: EdgeInsets.symmetric(vertical: CSizes.spaceBtwItems),
          child: Text("Hotel", style: CTextStyles.textStyle16),
        ),
        const CDetailCard(
          title: "Sheraton Montazah",
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
        ...List.generate(
          2,
          (index) => const CDetailCard(
            title: "Koshary Abou Tarek",
            subtitle: 'Alexandria',
            review: "(13 Review)",
            image: CImages.food2,
            additionalText: "Egyptian food",
            rating: "4.2",
            margin: EdgeInsets.only(bottom: CSizes.defaultSpace),
          ),
        ),

        //? places to visit
        const Text("Places to visit", style: CTextStyles.textStyle16),
        const SizedBox(height: CSizes.spaceBtwItems),
        const CDetailCard(
          title: "Pompey's Pillar",
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
