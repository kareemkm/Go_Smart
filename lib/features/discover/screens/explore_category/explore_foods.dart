import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/cards/detail_card.dart';
import 'package:go_smart/common/widgets/text_fields/search_field.dart';
import 'package:go_smart/features/discover/controller/home_controller.dart';
import 'package:go_smart/features/discover/models/resturant_model.dart';
import 'package:go_smart/features/discover/screens/category_details/food_details.dart';
import 'package:go_smart/features/discover/screens/explore_category/model/one_resturant.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class ExploreFoodsScreen extends StatelessWidget {
  const ExploreFoodsScreen( {super.key, required this.resturant});
  final List<Resturants> resturant;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder:(controller) => Scaffold(
        appBar: CAppBar(
          title: "Explore All Restaurants",
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
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
              child: CustomSearchTextField(),
            ),
            const SizedBox(height: CSizes.spaceBtwSections),
            Expanded(
              child: ListView.builder(
                itemCount:resturant.length??1,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: CSizes.defaultSpace),
                  child: CDetailCard(
                    isNetworkImage: true,
                    image:resturant[index].image ?? '',
                    title:resturant[index].resturantName ?? '',
                    subtitle:"${resturant[index].city}" ?? '',
                    review: "(50 Review)",
                    isSaved: false,
                    rating:"${resturant[index].rating}" ?? '',
                    additionalText: "${resturant[index].description}" ?? '',
                    margin: const EdgeInsets.symmetric(
                        horizontal: CSizes.defaultSpace),
                    onTapViewDetails: () async{
                      await controller.GetOneResturant(resturant[index].id ?? 0);
                      Get.to(() => FoodDetailsScreen(model: controller.oneResturant ?? OneResturant(),));
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
