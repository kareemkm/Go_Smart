import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/cards/review_card.dart';
import 'package:go_smart/common/widgets/images/rounded_image.dart';
import 'package:go_smart/common/widgets/section_headline.dart';
import 'package:go_smart/features/discover/controller/home_controller.dart';
import 'package:go_smart/features/discover/screens/Reviews/hote_reviews.dart';
import 'package:go_smart/features/discover/screens/category_details/widgets/top_container.dart';
import 'package:go_smart/features/discover/screens/category_details/widgets/visitor_information.dart';
import 'package:go_smart/features/discover/screens/gallery/gallery.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

import '../Reviews/landmark_review.dart';
import '../explore_category/model/one_landmark_model.dart';

List<String> images = [
  CImages.gallery1,
  CImages.gallery2,
  CImages.gallery3,
  CImages.gallery4,
  CImages.gallery5,
  CImages.gallery6,
  CImages.gallery7,
  CImages.gallery2,
];

class LandmarkDetailsScreen extends StatelessWidget {
  const LandmarkDetailsScreen({super.key, required this.model});

  final OneLandmark model;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder:(controller) =>  Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            TopContainer(
              image: model.landmark?.image ?? '',
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: CColors.primary,
                    size: 24,
                  ),
                  const SizedBox(width: CSizes.sm),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        model.landmark?.landmarkName ?? '',
                        style: CTextStyles.textStyle16,
                      ),
                      Text(
                        model.landmark?.city ?? '',
                        style: CTextStyles.textStyle14
                            .copyWith(color: CColors.darkGrey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    FontAwesomeIcons.solidBookmark,
                    color: CColors.primary,
                    size: 20,
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
                    'OverView',
                    style: CTextStyles.textStyle16.copyWith(
                        decoration: TextDecoration.underline,
                        color: CColors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: CSizes.spaceBtwItems,
                  ),
                   ReadMoreText(
                    model.landmark?.description ?? '',
                     trimLines: 4,
                    style: TextStyle(color: Colors.black),
                    colorClickableText: CColors.primary,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Collapse ',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: CSizes.spaceBtwItems),
                    child: Text(
                      'Visitor information:',
                      style: CTextStyles.textStyle16.copyWith(
                          color: CColors.primary, fontWeight: FontWeight.w600),
                    ),
                  ),
                  //? visitor information section
                  const VisitorInformationSection(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: CSizes.spaceBtwItems),
                    child: Text(
                      'Gallery',
                      style: CTextStyles.textStyle16.copyWith(
                          color: CColors.primary, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        4,
                        (i) =>  CRoundedImage(
                          image: images[i],
                          width: 60,
                          height: 72,
                          radius: CSizes.borderRadiusMd,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      CRoundedImage(
                        image: "assets/images/image 1.jpg",
                        onTap: () {
                          Get.to(() => GalleryScreen(
                                images: images,
                              ));
                        },
                        width: 60,
                        height: 72,
                        radius: CSizes.borderRadiusMd,
                        text: "+5",
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),

                  //? Additional Notes
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: CSizes.spaceBtwItems),
                    child: Text(
                      'Additional notes:',
                      style: CTextStyles.textStyle16.copyWith(
                          color: CColors.primary, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Column(children: [
                    Row(
                      children: [
                        Icon(Icons.circle, size: 10, color: CColors.primary),
                        SizedBox(width: CSizes.sm),
                        Text("The museum is closed on official holidays.")
                      ],
                    ),
                    SizedBox(height: CSizes.spaceBtwItems),
                    Row(
                      children: [
                        Icon(Icons.circle, size: 10, color: CColors.primary),
                        SizedBox(width: CSizes.sm),
                        Expanded(
                            child: Text(
                                "Photography is permitted inside the museum, but flash photography is not allowed."))
                      ],
                    ),
                    SizedBox(height: CSizes.spaceBtwItems),
                    Row(
                      children: [
                        Icon(Icons.circle, size: 10, color: CColors.primary),
                        SizedBox(width: CSizes.sm),
                        Expanded(
                            child: Text(
                                "Audio guides are available for rent in several languages."))
                      ],
                    ),
                  ]),
                  //? /////
                  //? reviews
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomSectionHeadline(
                      headText: 'Reviews',
                      headTextStyle: CTextStyles.textStyle16.copyWith(
                          color: CColors.primary, fontWeight: FontWeight.w600),
                      onTap: () async{
                        await controller.GetHotelreview(id: model.landmark?.id ?? 0);
                        Get.to(() =>  LandmarkReviewsScreen(
                          model: controller.landmarkReview,
                        ));
                      },
                      seeAll: 'SeeAll',
                    ),
                  ),
                  if (model.landmarkreview != null)
                   CReviewCard(
                    title: "Emyle Dav",
                    subtitle: "France",
                    image: "assets/images/person.png",
                    review:
                    model.landmarkreview?.comment ?? '',
                     rating: "${ model.landmarkreview?.rating ?? ''}"

                   ),
                  const SizedBox(height: CSizes.spaceBtwSections)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
