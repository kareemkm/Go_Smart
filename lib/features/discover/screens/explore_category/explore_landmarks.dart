import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/cards/detail_card.dart';
import 'package:go_smart/common/widgets/text_fields/search_field.dart';
import 'package:go_smart/features/discover/controller/home_controller.dart';
import 'package:go_smart/features/discover/models/landmarkmodel.dart';
import 'package:go_smart/features/discover/screens/category_details/landmark_details.dart';
import 'package:go_smart/features/discover/screens/explore_category/model/one_landmark_model.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class ExploreLandmarksScreen extends StatelessWidget {
  const ExploreLandmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController()..GetAlllandmark(),
      builder:(controller) {
        List<Landmarkss> landmark = controller.landmark;
         return Scaffold(
        appBar: CAppBar(
          title: "Explore All Landmarks",
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
                itemCount: landmark.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: CSizes.defaultSpace),
                  child: CDetailCard(
                    image:landmark[index].image ?? '',
                    title: landmark[index].landmarkName ?? '',
                    subtitle: "${landmark[index].city}" ?? '',
                    review: "(13 Review)",
                    isSaved: true,
                    isNetworkImage: true,
                    margin: const EdgeInsets.symmetric(
                        horizontal: CSizes.defaultSpace),
                    onTap: () async{
                      await controller.GetOneLandmark(landmark[index].id);
                     Get.to(() => LandmarkDetailsScreen(
                       model: controller.oneLandmark ?? OneLandmark(),
                     ));
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      );
  });
  }
}
