import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/cards/detail_card.dart';
import 'package:go_smart/features/discover/screens/category_details/city_details.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CTabView extends StatelessWidget {
  const CTabView({super.key, required this.data});
  final List data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          data.length,
          (index) => CDetailCard(
            onTap: () {
              // Get.to(() => CityDetailsScreen(image: data[index][0],location: data[index][2],));
            },
            title: data[index][1],
            subtitle: data[index][2],
            review: "(13 Review)",
            isSaved: true,
            image: data[index][0],
            margin: const EdgeInsets.only(
              right: CSizes.defaultSpace,
              left: CSizes.defaultSpace,
              bottom: CSizes.defaultSpace,
            ),
          ),
        ),
      ),
    );
  }
}
