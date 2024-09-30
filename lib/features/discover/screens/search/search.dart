import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/cards/detail_card.dart';
import 'package:go_smart/common/widgets/text_fields/search_field.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        title: "Search",
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchTextField(),
            const SizedBox(height: CSizes.spaceBtwItems),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Your Recent Searches",
                          style: CTextStyles.textStyle20),
                      const SizedBox(height: CSizes.spaceBtwItems),
                      Row(
                        children: [
                          const Icon(
                            Icons.history,
                            color: CColors.darkGrey,
                          ),
                          const SizedBox(width: CSizes.sm),
                          Text(
                            "Luxor",
                            style: CTextStyles.textStyle16.copyWith(
                              color: CColors.darkGrey,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                          height: CSizes.spaceBtwSections,
                          color: CColors.primary,
                          thickness: 0),
                      Row(
                        children: [
                          const Icon(
                            Icons.history,
                            color: CColors.darkGrey,
                          ),
                          const SizedBox(width: CSizes.sm),
                          Text(
                            "Hurghada",
                            style: CTextStyles.textStyle16.copyWith(
                              color: CColors.darkGrey,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: CSizes.spaceBtwSections * 2),
                      const Text("Popular Searches",
                          style: CTextStyles.textStyle20),
                      const SizedBox(height: CSizes.spaceBtwItems),
                      const Column(
                        children: [
                          CDetailCard(
                            title: "Dahab",
                            subtitle: '12 Hotel,5 activity',
                            review: "(13 Review)",
                            isSaved: false,
                            showSavedIcon: false,
                            image: CImages.hotel1,
                            margin:
                                EdgeInsets.only(bottom: CSizes.spaceBtwItems),
                          ),
                          CDetailCard(
                            title: "The Citadel of Qaitbay",
                            subtitle: 'Alexandrina',
                            review: "(13 Review)",
                            isSaved: false,
                            showSavedIcon: false,
                            image: CImages.landmark1,
                          ),
                        ],
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
