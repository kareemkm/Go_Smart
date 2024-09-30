import 'package:flutter/material.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class PlanStepsRow extends StatelessWidget {
  const PlanStepsRow({super.key, required this.currentStep, this.length = 3});
  final int currentStep;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSections),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CCircularContainer(
            height: 48,
            width: 48,
            color: currentStep == 1
                ? CColors.white
                : currentStep > 1
                    ? CColors.primary
                    : CColors.softGrey,
            enableBorder: currentStep > 1 ? false : true,
            borderColor: CColors.primary.withOpacity(.6),
            child: Text(
              "1",
              style: CTextStyles.textStyle20.copyWith(
                fontWeight: FontWeight.w500,
                color: currentStep > 1
                    ? Colors.white
                    : CColors.primary.withOpacity(.6),
              ),
            ),
          ),
          CCircularContainer(
            height: 3,
            width: 68,
            color: currentStep == 1
                ? CColors.primary.withOpacity(.6)
                : currentStep > 1
                    ? CColors.primary
                    : CColors.softGrey,
            margin: const EdgeInsets.symmetric(horizontal: 4),
          ),
          CCircularContainer(
            height: 48,
            width: 48,
            color: currentStep == 2
                ? CColors.white
                : currentStep > 2
                    ? CColors.primary
                    : CColors.softGrey,
            enableBorder: currentStep < 2 ? false : true,
            borderColor: CColors.primary.withOpacity(.6),
            child: Text(
              "2",
              style: CTextStyles.textStyle20.copyWith(
                fontWeight: FontWeight.w500,
                color: currentStep > 2
                    ? Colors.white
                    : currentStep == 2
                        ? CColors.primary.withOpacity(.6)
                        : Colors.black.withOpacity(.6),
              ),
            ),
          ),
          if (length == 3)
            Row(
              children: [
                CCircularContainer(
                  height: 3,
                  width: 68,
                  color: currentStep == 2
                      ? CColors.primary.withOpacity(.6)
                      : currentStep > 2
                          ? CColors.primary
                          : CColors.softGrey,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                ),
                CCircularContainer(
                  height: 48,
                  width: 48,
                  color: currentStep == 3
                      ? CColors.white
                      : currentStep > 3
                          ? CColors.primary
                          : CColors.softGrey,
                  enableBorder: currentStep < 3 ? false : true,
                  borderColor: CColors.primary.withOpacity(.6),
                  child: Text(
                    "3",
                    style: CTextStyles.textStyle20.copyWith(
                      fontWeight: FontWeight.w500,
                      color: currentStep > 3
                          ? Colors.white
                          : currentStep == 3
                              ? CColors.primary.withOpacity(.6)
                              : Colors.black.withOpacity(.6),
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
