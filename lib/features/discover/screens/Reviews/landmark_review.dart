import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/cards/review_card.dart';
import 'package:go_smart/features/discover/controller/home_controller.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import '../../models/landmark_review_model.dart';
import '../add_review/write_review.dart';

class LandmarkReviewsScreen extends StatelessWidget {
  const LandmarkReviewsScreen({super.key, this.model});
  final LandmarkReviews? model;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          LandmarkReviews? model = controller.landmarkReview;

          return Scaffold(
            appBar: const CAppBar(
              title: "Reviews",
              showBackArrow: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(CSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      model?.reviews?.length ?? 0,
                          (index) =>  Padding(
                        padding: EdgeInsets.only(bottom: CSizes.spaceBtwItems),
                        child: CReviewCard(
                          title: "Emyle Dav",
                          rating:"${model?.reviews?[index].rating ?? ''}" ,
                          subtitle: 'France',
                          image: CImages.person,
                          review:
                          "${model?.reviews?[index].comment ?? ''}",
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const WriteReviewScreen(
                          type: 2,
                        ));
                      },
                      child: Text(
                        "Write your Review",
                        style: CTextStyles.textStyle16.copyWith(
                            color: CColors.primary,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );}
    );
  }
}
