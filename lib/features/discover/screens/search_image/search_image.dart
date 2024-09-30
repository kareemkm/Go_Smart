import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/features/discover/screens/category_details/landmark_details.dart';
import 'package:go_smart/features/discover/screens/search_image/widgets/image_result_card.dart';
import 'package:go_smart/utils/constants/const.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class SearchImageScreen extends StatelessWidget {
  const SearchImageScreen({super.key, required this.imageFile,});

  final File imageFile;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image:
                DecorationImage(image: FileImage(imageFile), fit: BoxFit.cover),
          ),
        ),
        const CAppBar(
          showBackArrow: true,
          backArrowColor: Colors.white,
        ),
        Positioned(
          bottom: 50,
          right: CSizes.defaultSpace,
          left: CSizes.defaultSpace,
          child: CImageResultCard(
            title: scan_reault,
            subtitle: "Alexandria",
            review: "(13 Review)",
            isSaved: false,
            onTap: () async{
              // await
              // Get.to(() => const LandmarkDetailsScreen(image: CImages.landmark3 ,));
            },
          ),
        )
      ]),
    );
  }
}
