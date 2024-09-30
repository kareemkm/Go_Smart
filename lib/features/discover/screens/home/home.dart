import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/common/widgets/text_fields/search_field.dart';
import 'package:go_smart/common/widgets/section_headline.dart';
import 'package:go_smart/features/discover/controller/home_controller.dart';
import 'package:go_smart/features/discover/models/landmarkmodel.dart';
import 'package:go_smart/features/personalization/screens/notifications/notifications.dart';
import 'package:go_smart/features/discover/screens/home/widgets/popular_places.dart';
import 'package:go_smart/features/discover/screens/home/widgets/top_rated_card.dart';
import 'package:go_smart/features/discover/screens/home/widgets/offers_card.dart';
import 'package:go_smart/features/discover/screens/summer_offers/summer_offers.dart';
import 'package:go_smart/features/discover/screens/weekend_offers/weekend_offers.dart';
import 'package:go_smart/navigation_menu.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import 'widgets/categories_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool clicked = false;
  final List topRated = [
    [CImages.landmark3, 3.0, "Luxor"],
    [CImages.landmark2, 4.0, "Cairo"],
    [CImages.city1, 3.0, "Alexandria"],
    [CImages.landmark2, 4.0, "Cairo"],
  ];
  final List popularPlaces = [
    [CImages.pyramids, "Giza", "The Pyramids"],
    [CImages.landmark2, "Luxor", "The Valley of the Kings"],
    [CImages.pyramids, "Giza", "The Pyramids"],
    [CImages.landmark1, "Alexandria", "Citadel of Qaitbay"],
  ];

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NavigationMenuController());

    return GetBuilder<HomeController>(
      init: HomeController()..GetAlllandmark()..GetAllCity(),
      builder: (controller) => Scaffold(
        appBar: CAppBar(
            showBackArrow: false,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CCircularContainer(
                onTap: () {
                  // going to profile tap
                  Get.find<NavigationMenuController>().setSelectedTap(4);
                },
                child: SvgPicture.asset(CImages.account),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: CCircularContainer(
                    onTap: () {
                      Get.to(() => const NotificationsScreen());
                    },
                    child: SvgPicture.asset(CImages.bell, height: 60),
                  ),
                ),
              ),
            ]),
        body: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'What do you want to ',
                        style: CTextStyles.textStyle20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Explore',
                          style: CTextStyles.textStyle20
                              .copyWith(color: CColors.primary),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'today',
                    style: CTextStyles.textStyle20,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
      
                  //? search field
                  const CustomSearchTextField(
                    readOnly: true,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
      
                  //? categories section
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  const CategoriesList(),
                  const SizedBox(height: CSizes.spaceBtwItems),
      
                  //? top rated section
                  CustomSectionHeadline(
                      headText: 'Top Rated', seeAll: 'See All', onTap: () {}),
                  const SizedBox(height: CSizes.spaceBtwItems),
      
                  SizedBox(
                    height: 190,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: List.generate(
                        controller.citys.length,
                        (i) => TopRatedCard(
                          rating: 4.5,
                          image: "${controller.citys[i].image}",
                          title:  "${controller.citys[i].cityName}",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  //? popular places section
                  CustomSectionHeadline(
                      headText: 'Popular Places',
                      seeAll: 'See All',
                      onTap: () {}),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: List.generate(
                       controller.landmark.length,
                        (i) {
                         Landmarkss model = controller.landmark[i];
                        return PopularPlacesCard(
                          image: model.image??'',
                          location: "${model.city}",
                          title: "${model.landmarkName}",
                        );}
                      ),
                    ),
                  ),
                ],
              ),
            ),
      
            //? summer offers
            OffersCard(
              onTap: () {
                Get.to(() => const SummerOffersScreen());
              },
              image: Positioned(
                right: 0,
                bottom: 0,
                child: Image.asset(
                  CImages.offer1,
                  height: 210,
                ),
              ),
              title: "Let’s celebrate The Summer in Egypt",
              titleAlignment: Alignment.centerLeft,
              cardColor: CColors.primary,
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
      
            //? weekend offers
            OffersCard(
              onTap: () {
                Get.to(() => const WeekendOffersScreen());
              },
              image: Positioned(
                left: 0,
                bottom: 0,
                child: Image.asset(
                  CImages.offer2,
                  height: 210,
                ),
              ),
              title: "Never miss to enjoy our week end offer!",
              titleColor: const Color(0xff535E66),
              titleAlignment: Alignment.centerRight,
              cardColor: CColors.primary.withOpacity(.5),
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
