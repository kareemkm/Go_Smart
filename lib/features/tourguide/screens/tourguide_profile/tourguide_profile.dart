import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/cards/review_card.dart';
import 'package:go_smart/common/widgets/dialogs/main_alert_dialog.dart';
import 'package:go_smart/common/widgets/section_headline.dart';
import 'package:go_smart/features/discover/screens/Reviews/hote_reviews.dart';
import 'package:go_smart/features/payment/screens/payment_method/payment_method.dart';
import 'package:go_smart/features/tourguide/screens/tourguide_profile/widgets/contact_links.dart';
import 'package:go_smart/features/tourguide/screens/tourguide_profile/widgets/cost_card.dart';
import 'package:go_smart/features/tourguide/screens/tourguide_profile/widgets/top_container.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:go_smart/utils/enums/payment_in.dart';
import 'package:readmore/readmore.dart';

import '../../../../driver/features/model/all_driver_model.dart';

class TourguideProfileScreen extends StatelessWidget {
  const TourguideProfileScreen(
      {super.key, required this.image, this.onTapBookNow,  this.model});
  final String image;
  final VoidCallback? onTapBookNow;
  final Datum? model ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TourGuideTopContainer(image: image),
            Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //? tourguide name and rating
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model?.name ?? '',
                        style: CTextStyles.textStyle24,
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_rate_rounded,
                              color: CColors.starColor),
                          Text(
                            "4.3",
                            style: CTextStyles.textStyle14,
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    model?.city ?? '',
                    style: CTextStyles.textStyle14
                        .copyWith(color: CColors.darkGrey),
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections),

                  //? about tourguide
                  Text(
                    "About",
                    style: CTextStyles.textStyle16.copyWith(
                      color: CColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                   ReadMoreText(
                    model?.description ?? '',
                    trimLines: 4,
                    style: TextStyle(color: Colors.black),
                    colorClickableText: CColors.primary,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Collapse ',
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),

                  //? contact links section
                  Text(
                    "Contact Links",
                    style: CTextStyles.textStyle16
                        .copyWith(color: CColors.primary),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  const ContactLinks(),
                  const SizedBox(height: CSizes.spaceBtwSections),

                  //? cost per time
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CCostCard(
                          title: r"12$ per hour", icon: Icons.time_to_leave),
                      CCostCard(
                          title: r"130$ mid day", icon: Icons.time_to_leave),
                      CCostCard(
                          title: r"220$ Full day", icon: Icons.time_to_leave),
                    ],
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                   Row(
                    children: [
                      Icon(
                        Icons.time_to_leave,
                        color: CColors.primary,
                      ),
                      SizedBox(width: CSizes.sm),
                      Text("${model?.carType ?? ''}")
                    ],
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                   Row(
                    children: [
                      Icon(
                        Icons.translate,
                        color: CColors.primary,
                      ),
                      SizedBox(width: CSizes.sm),
                      Text("${model?.language ?? ''}")
                    ],
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  const Row(
                    children: [
                      Icon(
                        Icons.push_pin_outlined,
                        color: CColors.primary,
                      ),
                      SizedBox(width: CSizes.sm),
                      Expanded(
                        child: Text(
                            "has specific knowledge (e.g., local history, food, art)"),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: CSizes.spaceBtwItems),
                    child: CustomSectionHeadline(
                      headText: "Reviews",
                      onTap: () {
                        Get.to(() =>  HotelReviewsScreen());
                      },
                      seeAll: "See All",
                    ),
                  ),

                  const CReviewCard(
                    title: "Emyle Dav",
                    subtitle: "France",
                    image: CImages.person,
                    review:
                        'the Royal Jewelry Museum in Alexandria was an absolute must-visit. ',
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections),
                  CElevatedButton(
                    onPressed: onTapBookNow ??
                        () => showDialog(
                              context: context,
                              builder: (context) => CAlertDialog(
                                trailing: CElevatedButton(
                                  onPressed: () {
                                    Get.to(() => const PaymentMethodScreen(
                                          type: PaymentUsedIn.tourguideBooking,
                                        ));
                                  },
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                          horizontal: CSizes.defaultSpace)
                                      .copyWith(bottom: CSizes.defaultSpace),
                                  child: const Text("Pay \$80"),
                                ),
                                content:
                                    "The total cost for service is \$80. Please complete your payment to continue",
                              ),
                            ),
                    width: double.infinity,
                    child: const Text("Book Now"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
