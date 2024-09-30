import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/images/rounded_image.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CReviewCard extends StatelessWidget {
  const CReviewCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      this.isNetworkImage = false,
      this.onTap,
      this.rating,
      required this.review});
  final String title;
  final String subtitle;
  final String image;
  final String review;
  final bool isNetworkImage;
  final VoidCallback? onTap;
  final String? rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
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
            Padding(
              padding: const EdgeInsets.only(left: CSizes.md),
              child: CRoundedImage(
                image: image,
                width: 50,
                height: 50,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(CSizes.md),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
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
                          ),
                          const SizedBox(height: CSizes.sm),
                          SizedBox(
                            width: 180,
                            child: Text(
                              review,
                              style: CTextStyles.textStyle14,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: CSizes.sm + 2, vertical: CSizes.xs),
                            decoration: BoxDecoration(
                              color: CColors.primary,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(children: [
                              const Icon(
                                Icons.star_rate_rounded,
                                color: Colors.white,
                                size: CSizes.iconSm,
                              ),
                              const SizedBox(width: CSizes.sm),
                              Text(
                                rating ?? "4",
                                style: CTextStyles.textStyle12
                                    .copyWith(color: Colors.white),
                              )
                            ]),
                          ),
                        ],
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
