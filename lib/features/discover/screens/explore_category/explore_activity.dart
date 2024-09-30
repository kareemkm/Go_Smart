import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/text_fields/search_field.dart';
import 'package:go_smart/features/discover/screens/explore_category/more_activities.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import 'widgets/activity_card.dart';

final List<String> images = [
  CImages.landmark2,
  CImages.activity1,
  CImages.activity2,
  CImages.activity3,
];

class ExploreActivitiesScreen extends StatelessWidget {
  const ExploreActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: "Explore All Activity",
        titleStyle: CTextStyles.textStyle20,
        centerTitle: false,
        showBackArrow: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.sliders,
              color: CColors.primary,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          children: [
            const CustomSearchTextField(),
            const SizedBox(height: CSizes.spaceBtwSections),
            Expanded(
              child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: CSizes.md,
                    mainAxisSpacing: CSizes.spaceBtwSections,
                    mainAxisExtent: 220,
                  ),
                  children: [
                    CActivityCard(
                      title: "Historical",
                      image: images[0],
                      onTap: () {
                        List images = [
                          CImages.city6,
                          CImages.city8,
                          CImages.city4,
                          CImages.city5,
                          CImages.landmark6,
                          CImages.landmark2,
                        ];
                        Get.to(
                          () => MoreActivitiesScreen(
                            pageTitle: "Exploring ancient wonders",
                            images: images,
                          ),
                        );
                      },
                    ),
                    CActivityCard(
                      title: "Snorkeling and diving",
                      image: images[1],
                      onTap: () {
                        List images = [
                          CImages.ad21,
                          CImages.ad22,
                          CImages.ad23,
                          CImages.ad24,
                          CImages.ad25,
                          CImages.ad26,
                        ];
                        Get.to(
                          () => MoreActivitiesScreen(
                            pageTitle: "Enjoy Snorkeling and diving",
                            images: images,
                          ),
                        );
                      },
                    ),
                    CActivityCard(
                      title: "Relaxation",
                      image: images[2],
                      onTap: () {
                        List images = [
                          CImages.city1,
                          CImages.city2,
                          CImages.city4,
                          CImages.city5,
                        ];
                        Get.to(
                          () =>  MoreActivitiesScreen(
                            pageTitle: "Egypt absolutely delightful",
                            images: images,
                          ),
                        );
                      },
                    ),
                    CActivityCard(
                      title: "Safari",
                      image: images[3],
                      onTap: () {
                        List images = [
                          CImages.ad41,
                          CImages.ad42,
                          CImages.ad43,
                          CImages.ad44,
                          CImages.ad45,
                          CImages.ad46,
                        ];
                        Get.to(
                          () => MoreActivitiesScreen(
                            pageTitle: "adventure unlike any other",
                            images: images,
                          ),
                        );
                      },
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
