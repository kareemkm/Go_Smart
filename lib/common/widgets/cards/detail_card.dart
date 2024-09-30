import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CDetailCard extends StatefulWidget {
  const CDetailCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.review,
    this.isSaved = false,
    this.showSavedIcon = true,
    this.trailing,
    this.details,
    this.price,
    required this.image,
    this.isNetworkImage = false,
    this.onTap,
    this.additionalText,
    this.onTapViewDetails,
    this.rating,
    this.margin,
  });
  final String title;
  final String subtitle;
  final String image;
  final bool isNetworkImage;
  final String review;
  final bool isSaved;
  final Widget? trailing;
  final Widget? details;
  final Text? price;
  final VoidCallback? onTap;
  final String? additionalText;
  final VoidCallback? onTapViewDetails;
  final String? rating;
  final EdgeInsetsGeometry? margin;
  final bool showSavedIcon;

  @override
  State<CDetailCard> createState() => _CDetailCardState();
}

class _CDetailCardState extends State<CDetailCard> {
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
      child: Container(
        height: widget.additionalText != null ? 120 : 102,
        margin: widget.margin,
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
                    image: widget.isNetworkImage
                        ? NetworkImage(widget.image) as ImageProvider
                        : AssetImage(widget.image),
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
                              widget.title,
                              style: CTextStyles.textStyle16.copyWith(
                                  decoration: TextDecoration.underline),
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
                            if (widget.additionalText != null)
                              Text(widget.additionalText!,
                              overflow: TextOverflow.ellipsis,
                              ) ,
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (widget.showSavedIcon)
                            widget.rating != null
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                        const Icon(Icons.star_rate_rounded,
                                            color: CColors.starColor, size: 20),
                                        const SizedBox(width: CSizes.xs),
                                        Text(widget.rating!)
                                      ])
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSaved = !isSaved;
                                      });
                                    },
                                    child: Icon(
                                      isSaved
                                          ? Icons.bookmark
                                          : Icons.bookmark_border,
                                      color: CColors.primary,
                                    ),
                                  ),
                          if (widget.additionalText != null)
                            GestureDetector(
                              onTap: widget.onTapViewDetails,
                              child: Text(
                                "View details",
                                style: CTextStyles.textStyle14.copyWith(
                                    decoration: TextDecoration.underline,                                    
                                    color: CColors.primary),
                              ),
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
