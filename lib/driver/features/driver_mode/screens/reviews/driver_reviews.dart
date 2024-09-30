import 'package:flutter/material.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/cards/review_card.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class DriverReviewsScreen extends StatelessWidget {
  const DriverReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        title: "Reviews",
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, i) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace,vertical: CSizes.spaceBtwItems / 2),
          child: CReviewCard(
            title: "Emyle Dav",
            subtitle: "France",
            image: CImages.person,
            review:
                "the Royal Jewelry Museum in Alexandria was an absolute must-visit.",
            rating: "4",
          ),
        ),
      ),
    );
  }
}
