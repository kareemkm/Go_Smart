import 'package:flutter/material.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class WriteReviewTextField extends StatelessWidget {
  const WriteReviewTextField({super.key,  this.controller});
final TextEditingController? controller ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(CSizes.md),
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
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Type here............ ",
            suffix: Icon(
              Icons.edit,
              color: CColors.primary,
            )),
      ),
    );
  }
}
