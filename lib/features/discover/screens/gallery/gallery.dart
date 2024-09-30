import 'package:flutter/material.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/images/rounded_image.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key, this.onTap, required this.images});
  final VoidCallback? onTap;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        title: "Gallery",
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: CSizes.md,
            mainAxisSpacing: CSizes.spaceBtwSections,
          ),
          children: images
              .map(
                (e) => CRoundedImage(
                  onTap: () {},
                  image: e,
                  radius: 8,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
