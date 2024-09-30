import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/images/rounded_image.dart';
import 'package:go_smart/features/discover/screens/category_details/widgets/top_container.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class SummerOffersScreen extends StatelessWidget {
  const SummerOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List summerOffers = [
      [CImages.sOffer1,"Boat tour to Orange Bay"],
      [CImages.sOffer2,"desert safari"],
      [CImages.sOffer3,"fun dolphin watching"],
    ];
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const TopContainer(image: CImages.city2),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: CColors.primary,
                  size: 24,
                ),
                Text(
                  'Hurghada',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fun time at Hurghada',
                  style: CTextStyles.textStyle16.copyWith(
                      decoration: TextDecoration.underline,
                      color: CColors.primary),
                ),
                const SizedBox(
                  height: CSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  "Hurghada town is most famous among the Red Sea shorelines, that offers oodles of fun activities in Egypt. The mesmerizing scene here, total with crystal clear waters, coral reefs, and sandy beaches make as an ideal spot for swimming and diving (as said above). Also",
                  trimLines: 4,
                  style: TextStyle(color: Colors.black),
                  colorClickableText: CColors.primary,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: ' Collapse ',
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                ...List.generate(
                  summerOffers.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${index + 1}-${summerOffers[index][1]}",style: CTextStyles.textStyle16,),
                        const SizedBox(height: CSizes.spaceBtwItems),
                        CRoundedImage(
                          image: summerOffers[index][0],
                          width: double.infinity,
                          height: 120,
                          radius: 12,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: CSizes.spaceBtwItems,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("And More To Enjoy", style: CTextStyles.textStyle16),
                    SizedBox(width: CSizes.xs),
                    Icon(Icons.favorite_outlined, color: Colors.red)
                  ],
                ),
                const SizedBox(
                  height: CSizes.spaceBtwSections,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
