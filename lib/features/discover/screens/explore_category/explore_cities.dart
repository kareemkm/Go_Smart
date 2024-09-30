import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/images/rounded_image.dart';
import 'package:go_smart/common/widgets/text_fields/search_field.dart';
import 'package:go_smart/features/discover/controller/home_controller.dart';
import 'package:go_smart/features/discover/screens/category_details/city_details.dart';
import 'package:go_smart/features/discover/screens/explore_category/model/one_city_model.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class ExploreCitiesScreen extends StatelessWidget {
  const ExploreCitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController().GetAllCity(),
      builder:(controller) =>  Scaffold(
        appBar: CAppBar(
          title: "Explore All Cities",
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
                  child: GridView.builder(
                itemCount: controller.citys.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: CSizes.md,
                    mainAxisSpacing: CSizes.spaceBtwSections),
                itemBuilder: (context, index) {
                  return CRoundedImage(
                    isNetworkImage: true,
                    onTap: () async{
                      await controller.GetOneCity(controller.citys[index].id ?? 0);
                      Get.to(
                        () => CityDetailsScreen(
                         model:  controller.city ?? OneCity(),
                        ),
                      );
                    },
                    image: controller.citys[index].image ?? '',
                    text:  controller.citys[index].cityName ?? '',
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
