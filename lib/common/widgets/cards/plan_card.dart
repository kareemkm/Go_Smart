import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CPlanCard extends StatefulWidget {
  const CPlanCard({
    super.key,
    required this.title,
    required this.review,
    this.price,
    required this.image,
    this.isNetworkImage = false,
    this.onTap,
    this.onTapLearnMore,
    this.margin,
    required this.isSelected,
  });
  final String title;
  final String image;
  final bool isNetworkImage;
  final String review;
  final bool isSelected;
  final String? price;
  final VoidCallback? onTap;
  final VoidCallback? onTapLearnMore;
  final EdgeInsetsGeometry? margin;

  @override
  State<CPlanCard> createState() => _CPlanCardState();
}

class _CPlanCardState extends State<CPlanCard> {
  late bool isSelected;
  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 100,
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
                              widget.review,
                              style: CTextStyles.textStyle14.copyWith(
                                  color: CColors.primary.withOpacity(.5),
                                  decoration: TextDecoration.underline),
                            ),
                            const Spacer(),
                            if (widget.price != null)
                              Text(
                                widget.price!,
                                style: CTextStyles.textStyle12
                                    .copyWith(color: CColors.primary),
                              ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Checkbox(
                              value: isSelected,
                              onChanged: (val) {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              }),
                          GestureDetector(
                            onTap: widget.onTapLearnMore,
                            child: Text(
                              "Learn more",
                              style: CTextStyles.textStyle16.copyWith(
                                decoration: TextDecoration.underline,
                              ),
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
