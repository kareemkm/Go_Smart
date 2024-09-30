import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CTourGuideCard extends StatelessWidget {
  const CTourGuideCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.review,
    required this.price,
    required this.image,
    this.isNetworkImage = false,
    this.onTap,
    this.onTapViewProfile,
    required this.rating,
    this.margin,
  });
  final String title;
  final String subtitle;
  final String image;
  final bool isNetworkImage;
  final String review;
  final String price;
  final VoidCallback? onTap;
  final VoidCallback? onTapViewProfile;
  final String rating;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                offset: const Offset(1, 3),
                blurRadius: 5,
              )
            ]),
        child: Row(
          children: [
            //? image
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: isNetworkImage
                        ? NetworkImage(image) as ImageProvider
                        : AssetImage(image),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(CSizes.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: CTextStyles.textStyle16
                                .copyWith(decoration: TextDecoration.underline),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            subtitle,
                            style: CTextStyles.textStyle14
                                .copyWith(color: CColors.darkGrey),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: CSizes.xs),
                          Text(
                            review,
                            style: CTextStyles.textStyle14.copyWith(
                                color: CColors.primary.withOpacity(.5),
                                decoration: TextDecoration.underline),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: CSizes.xs),
                          Text(
                            price,
                            style: CTextStyles.textStyle14,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: onTapViewProfile,
                          child: Row(
                            children: [
                              SvgPicture.asset(CImages.locationArrow),
                              Text(
                                "View profile",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: CTextStyles.textStyle12
                                    .copyWith(color: CColors.darkGrey),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star_rate_rounded,
                                color: CColors.starColor),
                            Text(
                              rating,
                              style: CTextStyles.textStyle14,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Expanded(
//   flex: 5,
//   child: Padding(
//     padding: const EdgeInsets.all(CSizes.md),
//     child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 flex: 3,
                // child: Text(
                //   title,
                //   style: CTextStyles.textStyle16.copyWith(
                //       decoration: TextDecoration.underline),
                //   overflow: TextOverflow.ellipsis,
                //   maxLines: 1,
                // ),
//               ),
//               const SizedBox(width: CSizes.spaceBtwItems),
//             ],
//           ),
          // Text(
          //   subtitle,
          //   style: CTextStyles.textStyle14
          //       .copyWith(color: CColors.darkGrey),
          // ),
          // const SizedBox(height: CSizes.spaceBtwItems / 2),
          // Text(
          //   review,
          //   style: CTextStyles.textStyle14.copyWith(
          //       color: CColors.primary.withOpacity(.5),
          //       decoration: TextDecoration.underline),
          // ),
//           if (additionalText != null)
//             Padding(
//               padding: const EdgeInsets.only(top: CSizes.sm),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(additionalText!),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       "View details",
//                       style: CTextStyles.textStyle14.copyWith(
//                           decoration: TextDecoration.underline,
//                           color: CColors.primary),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//         ]),
//   ),
// )
