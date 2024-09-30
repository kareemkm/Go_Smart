import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CAppBar(
      {super.key,
      this.showBackArrow = true,
      this.title,
      this.actions,
      this.leading,
      this.titleStyle,
      this.centerTitle = true,
      this.backArrowColor = Colors.black, this.onTapBackArrow});
  final bool showBackArrow;
  final VoidCallback? onTapBackArrow;
  final String? title;
  final TextStyle? titleStyle;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Color backArrowColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading: leading ??
          (showBackArrow
              ? IconButton(
                  onPressed: onTapBackArrow ?? () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded,color: backArrowColor,),
                )
              : null),
      title: title != null
          ? Text(title!, style: titleStyle ?? CTextStyles.textStyle24)
          : null,
      actions: actions,
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(CSizes.appBarHeight);
}
