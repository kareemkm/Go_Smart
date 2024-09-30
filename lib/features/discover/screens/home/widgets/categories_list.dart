import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/features/discover/controller/home_controller.dart';
import 'package:go_smart/features/discover/screens/explore_category/explore_activity.dart';
import 'package:go_smart/features/discover/screens/explore_category/explore_cities.dart';
import 'package:go_smart/features/discover/screens/explore_category/explore_foods.dart';
import 'package:go_smart/features/discover/screens/explore_category/explore_hotels.dart';
import 'package:go_smart/features/discover/screens/explore_category/explore_landmarks.dart';
import 'package:go_smart/features/discover/screens/home/widgets/clickable_container.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder:(controller) =>  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClickableContainer(
            isClicked: false,
            categoryText: 'City',
            categoryIcon: Icons.location_on,
            onTap: () {
              Get.to(() => const ExploreCitiesScreen());
            },
          ),
          ClickableContainer(
            isClicked: false,
            categoryText: 'Landmark',
            categoryIcon: Icons.temple_hindu_rounded,
            onTap: () async{
              await controller.GetAlllandmark();
              Get.to(() => const ExploreLandmarksScreen());
            },
          ),
          ClickableContainer(
            isClicked: false,
            categoryText: 'Hotels',
            categoryIcon: Icons.hotel,
            onTap: () async{
              await controller.GetAllHotels();
              Get.to(() =>  ExploreHotelsScreen(
               hotels: controller.hotels
              ));
            },
          ),
          ClickableContainer(
            isClicked: false,
            categoryText: 'Activity',
            categoryIcon: Icons.directions_run_sharp,
            onTap: () {
              Get.to(() => const ExploreActivitiesScreen());
            },
          ),
          ClickableContainer(
            isClicked: false,
            categoryText: 'Food',
            categoryIcon: Icons.restaurant_menu_rounded,
            onTap: () async{
               await controller.GetAlresturant();
              Get.to(()=> ExploreFoodsScreen(
              resturant:   controller.resturant
              ));
            },
          ),
        ],
      ),
    );
  }
}
