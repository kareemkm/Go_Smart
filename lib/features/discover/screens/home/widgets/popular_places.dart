import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/images/rounded_image.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class PopularPlacesCard extends StatelessWidget {
  const PopularPlacesCard({
    super.key, required this.location, required this.title, required this.image,
  });
  final String location;
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: CRoundedImage(
              isNetworkImage: true,
              image: image,
              width: 168,
              height: 96,
              padding: const EdgeInsets.all(CSizes.sm),
              child: Opacity(
                opacity: .8,
                child: Row(
                  children: [
                    const Icon(Icons.location_on_sharp,size: 16,),
                    const SizedBox(width: CSizes.xs),
                    Text(location,style: CTextStyles.textStyle14,)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              title,
            ),
          ),
        ],
      ),
    );
  }
}
