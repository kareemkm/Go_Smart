import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/cards/detail_card.dart';
import 'package:go_smart/common/widgets/section_headline.dart';
import 'package:go_smart/features/discover/controller/home_controller.dart';
import 'package:go_smart/features/discover/screens/category_details/landmark_details.dart';
import 'package:go_smart/features/discover/screens/category_details/widgets/top_container.dart';
import 'package:go_smart/features/discover/screens/explore_category/model/one_city_model.dart';
import 'package:go_smart/features/discover/screens/explore_category/model/one_landmark_model.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class CityDetailsScreen extends StatelessWidget {
  const CityDetailsScreen({super.key, required this.model,});

  final OneCity model;
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder:(controller) => controller.city != null ? Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            TopContainer(image: model.city?.image  ?? '',
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
                  Text(
                   model.city?.cityName ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
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
                    style: CTextStyles.textStyle16.copyWith(decoration: TextDecoration.underline,color: CColors.primary),
                  ),
                  const SizedBox(
                    height: CSizes.spaceBtwItems,
                  ),
                  ReadMoreText(
                    model.city?.description ?? '',
                    trimLines: 4,
                    style: const TextStyle(color: Colors.black),
                    colorClickableText: CColors.primary,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Collapse ',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomSectionHeadline(
                      headText: 'popular places',
                      onTap: () {},
                      seeAll: 'SeeAll',
                    ),
                  ),
                  CDetailCard(
                    title: model.landmark?.landmarkName??'',
                    subtitle: model.landmark?.city ?? '',
                    review: '(13 Review)',
                    isSaved: true,
                    image: model.landmark?.image?? '',
                    isNetworkImage: true,
                    onTap: ()async{
                      await controller.GetOneLandmark(model.landmark?.id ?? 0);
                      Get.to(() =>  LandmarkDetailsScreen(model: controller.oneLandmark ?? OneLandmark() ));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomSectionHeadline(
                      headText: 'Restaurant&Cafe',
                      onTap: () {},
                      seeAll: 'SeeAll',
                    ),
                  ),
                  CDetailCard(
                    title:model.restaurant?.resturantName ?? '',
                    subtitle: model.restaurant?.city ?? '',
                    review: '(13 Review)',
                    isSaved: true,
                    image: model.restaurant?.image  ?? '',
                    additionalText: "Italian food",
                    rating: model.restaurant?.rating ?? '',
                     isNetworkImage: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomSectionHeadline(
                      headText: 'Hotels',
                      onTap: () {},
                      seeAll: 'SeeAll',
                    ),
                  ),
                   CDetailCard(
                    title:  model.hotel?.hotelName ?? '',
                    subtitle:model.hotel?.city ?? '',
                    review: '(13 Review)',
                    isSaved: true,
                    image:model.hotel?.image1  ?? '',
                    additionalText:model.hotel?.description ?? '',
                    rating: model.hotel?.rating ?? '',
                     isNetworkImage: true,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems)
                ],
              ),
            ),
          ],
        ),
      )
    : Scaffold(body: Center(child: CircularProgressIndicator(),),),
    );
  }
}
