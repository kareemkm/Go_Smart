import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/cards/detail_card.dart';
import 'package:go_smart/features/discover/screens/category_details/widgets/top_container.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class WeekendOffersScreen extends StatelessWidget {
  const WeekendOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List weekendOffers = [
      [CImages.wOffer2, "The Egyptian Museum"],
      [CImages.wOffer3, "Salah Al-Din Al-Ayoubi Castle"],
      [CImages.wOffer4, "The Hanging Church"],
      [CImages.wOffer5, "The Royal Jewelry Museum"],
    ];
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const TopContainer(image: CImages.wOffer1),
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
                  'Cairo',
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
                  '24 Hours in Cairo',
                  style: CTextStyles.textStyle16.copyWith(
                      decoration: TextDecoration.underline,
                      color: CColors.primary),
                ),
                const SizedBox(
                  height: CSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  "Cairo is the capital of Egypt, a city rich in world famous history, it is a great place to explore Egyptian history and culture. Even though Cairo is an ancient city; but it is also a modern metropolis. If you are visiting Egypt then Cairo must be on your Itinerary",
                  trimLines: 4,
                  style: TextStyle(color: Colors.black),
                  colorClickableText: CColors.primary,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: ' Collapse ',
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                ...List.generate(
                  weekendOffers.length,
                  (index) => Column(
                    children: [
                      const SizedBox(height: CSizes.spaceBtwItems),
                      CDetailCard(
                        title: weekendOffers[index][1],
                        subtitle: 'Cairo',
                        review: '(10 Review)',
                        isSaved: true,
                        image: weekendOffers[index][0],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: CSizes.spaceBtwItems,
                ),
                Text(
                  'Best Time to Visit Cairo',
                  style: CTextStyles.textStyle16.copyWith(
                      decoration: TextDecoration.underline,
                      color: CColors.primary),
                ),
                const SizedBox(
                  height: CSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  "The best time to visit Egypt in general is between October and April, but when it comes to Cairo, if you are looking for a nice and warm weather, then it is best to visit in October, November, and April. You can of course visit Egypt during the summer, but it gets really hot during that time.",
                  trimLines: 4,
                  style: TextStyle(color: Colors.black),
                  colorClickableText: CColors.primary,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: ' Collapse ',
                ),
                const SizedBox(
                  height: CSizes.spaceBtwSections,
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
