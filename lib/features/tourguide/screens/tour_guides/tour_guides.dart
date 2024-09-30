import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/cards/tourguide_card.dart';
import 'package:go_smart/common/widgets/text_fields/stadium_text_field.dart';
import 'package:go_smart/features/tourguide/screens/tourguide_profile/tourguide_profile.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class TourGuidesScreen extends StatelessWidget {
  const TourGuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List tourguides = [
      [CImages.tourguide1, "Mohamed Youssef","Cairo"],
      [CImages.tourguide2, "Mohamed Youssef","Cairo"],
      [CImages.tourguide3, "Ahmed Hossam","Luxor"],
      [CImages.tourguide4, "Eslam El-sayed","Aswan"],
      [CImages.tourguide5, "Mahmoud Aly","Dahab"],
    ];
    return Scaffold(
      appBar: const CAppBar(title: "Tour Guide", showBackArrow: true),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const CStadiumTextField(
            icon: Icon(Icons.search),
            hintText: "search",
            suffixIcon: Icon(Icons.filter_list),
          ),
          // const SizedBox(height: CSizes.spaceBtwItems),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, i) => CTourGuideCard(
                title: tourguides[i][1],
                subtitle: tourguides[i][2],
                review: "(10 Review)",
                image: tourguides[i][0],
                price: r"14$ per hour",
                rating: "4.5",
                onTapViewProfile: () {
                  Get.to(() => TourguideProfileScreen(image: tourguides[i][0],));
                },
                margin: const EdgeInsets.only(
                  bottom: CSizes.defaultSpace,
                  right: CSizes.defaultSpace,
                  left: CSizes.defaultSpace,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
