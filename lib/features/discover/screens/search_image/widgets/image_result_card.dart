import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/containers/rounded_container.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CImageResultCard extends StatefulWidget {
  const CImageResultCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.review,
    required this.isSaved,
    this.trailing,
    this.price,
    this.onTap,
    this.additionalText,
    this.onTapViewDetails,
    this.rating,
    this.margin,
  });
  final String title;
  final String subtitle;
  final String review;
  final bool isSaved;
  final Widget? trailing;
  final Text? price;
  final VoidCallback? onTap;
  final String? additionalText;
  final VoidCallback? onTapViewDetails;
  final String? rating;
  final EdgeInsetsGeometry? margin;

  @override
  State<CImageResultCard> createState() => _CImageResultCardState();
}

class _CImageResultCardState extends State<CImageResultCard> {
  late bool isSaved;
  @override
  void initState() {
    super.initState();
    isSaved = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: CRoundedContainer(
        margin: widget.margin,
        height: null,
        color: Colors.white,
        radius: 16,
        padding: const EdgeInsets.all(CSizes.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? icon
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(CImages.locationArrow, height: 24),
              ],
            ),
            const SizedBox(width: CSizes.spaceBtwItems),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: CTextStyles.textStyle16
                                .copyWith(decoration: TextDecoration.underline),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(width: CSizes.spaceBtwItems),
                          Text(
                            widget.subtitle,
                            style: CTextStyles.textStyle14
                                .copyWith(color: CColors.darkGrey),
                          ),
                          const SizedBox(height: CSizes.spaceBtwItems / 2),
                          Text(
                            widget.review,
                            style: CTextStyles.textStyle14.copyWith(
                                color: CColors.primary.withOpacity(.5),
                                decoration: TextDecoration.underline),
                          ),
                          const SizedBox(height: CSizes.sm),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSaved = !isSaved;
                            });
                          },
                          child: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_border,
                            color: CColors.primary,
                          ),
                        )
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
