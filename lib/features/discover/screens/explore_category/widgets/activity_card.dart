import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/images/rounded_image.dart';

class CActivityCard extends StatelessWidget {
  const CActivityCard({super.key, required this.title, required this.image, required this.onTap});
  final String image;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CRoundedImage(
              height: 190,
              width: 172,
              image: image,
              radius: 8,
            ),
            SizedBox(
              width: 172,
              child: Text(
                title,
                style:
                    CTextStyles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
