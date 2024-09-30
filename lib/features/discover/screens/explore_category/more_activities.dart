import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/images/rounded_image.dart';
import 'package:go_smart/common/widgets/text_fields/search_field.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class MoreActivitiesScreen extends StatelessWidget {
  const MoreActivitiesScreen({super.key, required this.pageTitle, required this.images});
  final String pageTitle;
  final List images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        title: pageTitle,
        titleStyle: CTextStyles.textStyle20,
        centerTitle: false,
        showBackArrow: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.sliders,
              color: CColors.primary,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          children: [
            const CustomSearchTextField(),
            const SizedBox(height: CSizes.spaceBtwSections),
            Expanded(
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: CSizes.md,
                    mainAxisSpacing: CSizes.spaceBtwSections),
                itemBuilder: (context, index) {
                  return CRoundedImage(
                    image: images[index],
                    text: "Alexandria",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
