import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class CCarouselSlider extends StatefulWidget {
  const CCarouselSlider({super.key});

  @override
  State<CCarouselSlider> createState() => _CCarouselSliderState();
}

class _CCarouselSliderState extends State<CCarouselSlider> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: CSizes.defaultSpace),
          child: CarouselSlider(
            items: [
              Image.asset(CImages.masterCard),
              Image.asset(CImages.masterCard),
              Image.asset(CImages.masterCard),
            ],
            options: CarouselOptions(
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, _) {
                setState(() {
                  current = index;
                });
              },
            ),
          ),
        ),
        AnimatedSmoothIndicator(
          activeIndex: current,
          effect: const WormEffect(
              dotWidth: 8,
              dotHeight: 8,
              activeDotColor: Colors.black,
              dotColor: CColors.grey
          ),
          count: 3,
        )
      ],
    );
  }
}