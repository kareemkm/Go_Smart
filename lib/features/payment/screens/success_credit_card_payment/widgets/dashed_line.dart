import 'package:flutter/material.dart';
import 'package:go_smart/common/widgets/containers/rounded_container.dart';

class CDashedLine extends StatelessWidget {
  const CDashedLine({Key? key, this.height = 2, this.color = Colors.grey})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return CRoundedContainer(
              width: dashWidth,
              height: dashHeight,
              color: color,
              child: const SizedBox(),
            );
          }),
        );
      },
    );
  }
}