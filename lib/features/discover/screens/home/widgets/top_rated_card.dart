import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_smart/common/widgets/images/rounded_image.dart';
import 'package:go_smart/utils/constants/colors.dart';

class TopRatedCard extends StatelessWidget {
  const TopRatedCard({
    super.key,
    required this.image,
    required this.rating,
    required this.title, this.onTap,
  });
  final double rating;
  final String image;
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: CRoundedImage(
              isNetworkImage: true,
              width: 117,
              height: 136,
              image: image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(title),
          ),
          RatingBar.builder(
            itemSize: 20,
            minRating: 1,
            maxRating: 5,
            itemBuilder: (context, index) => Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: CColors.starColor,
              // size: 16,
            ),
            unratedColor: CColors.starColor,
            ignoreGestures: true,
            initialRating: rating,
            onRatingUpdate: (rating) {},
          ),
        ],
      ),
    );
  }
}
