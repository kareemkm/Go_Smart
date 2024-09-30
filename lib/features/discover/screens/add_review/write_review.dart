import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/images/rounded_image.dart';
import 'package:go_smart/features/discover/controller/home_controller.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import 'widgets/write_review_textfield.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({super.key, this.type});
  final int? type;


  @override
  Widget build(BuildContext context) {
    TextEditingController review = TextEditingController();
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder:(controller) =>  Scaffold(
        appBar: const CAppBar(
          title: "Write Review",
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
            child: Column(
              children: [
                const CRoundedImage(
                  image: CImages.hotel1,
                  height: 150,
                  width: 150,
                  radius: 16,
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                const Text("How was your Experience with ",
                    style: CTextStyles.textStyle16),
                const SizedBox(height: CSizes.spaceBtwItems),
                Text(
                  "Name Of Service",
                  style: CTextStyles.textStyle20
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                RatingBar.builder(

                  itemSize: 24,
                  minRating: 1,
                  maxRating: 5,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Color(0xffF4CE14),
                  ),
                  onRatingUpdate: (rating) {
                    controller.changeRate(rating);

                  },
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                Text(
                  "Write Your review",
                  style: CTextStyles.textStyle16.copyWith(
                    color: CColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                 WriteReviewTextField(
                  controller: review,
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                CElevatedButton(
                  onPressed: () async{
                    if(type==1){
                   await controller.Addresturantreview(comment: review.text,id: controller.oneResturant?.resturant?.id ?? 0);
                 }else if(type == 2){
                      await controller.Addlandmarkreview(comment: review.text,id: controller.oneLandmark?.landmark?.id ?? 0);
                    } else{
                      await controller.AddHotelreview(comment: review.text,id: controller.Onehotel?.hotel?.id ?? 0);

                    }
                  },
                  width: double.infinity,
                  child: const Text("Submit Review"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
