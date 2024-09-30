import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TourGuideTopContainer extends StatelessWidget {
  const TourGuideTopContainer(
      {super.key, required this.image, this.isNetworkImage = false});
  final String image;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipPath(
        clipper: CustomContainerClipper(),
        child: Container(
          height: 230,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: isNetworkImage
                  ? NetworkImage(image) as ImageProvider
                  : AssetImage(image),
            ),
          ),
        ),
      ),
      Positioned(
        top: 60,
        left: 16,
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      )
    ]);
  }
}

class CustomContainerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var h = size.height;
    var w = size.width;
    Path path = Path() // Start from (0,0)
      ..lineTo(0, size.height)
      ..lineTo(0, h)
      ..lineTo(.25 * w, 0.75 * h)
      ..lineTo(.5 * w, h)
      ..lineTo(w - 20, 0.8 * h)
      ..lineTo(w, 0.83 * h)
      ..lineTo(w, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
