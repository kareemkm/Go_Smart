import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/text_fields/stadium_text_field.dart';
import 'package:go_smart/features/discover/screens/search/search.dart';
import 'package:go_smart/features/discover/screens/search_image/controller/scan_controller.dart';
import 'package:go_smart/features/discover/screens/search_image/search_image.dart';
import 'package:go_smart/utils/device/device_utility.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField(
      {super.key,this.readOnly = false, this.hintText,});
  final bool readOnly;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScanController>(
      init: ScanController(),
      builder:(controller) =>  CStadiumTextField(
        hintText: hintText ?? "search",
        icon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.camera_alt_outlined),
        padding: EdgeInsets.zero,
        onTapLeading: () {
          Get.to(() => const SearchScreen());
        },
        onTapTrailing: () async {
          File? imageFile = await CDeviceUtils.pickImageUsingCamera();

          if (imageFile != null) {
            await controller.Scan(imageFile);
            Get.to(() => SearchImageScreen(imageFile: imageFile));
          }
        },
        readOnly: readOnly,
      ),
    );
  }
}



// TextField(
//       readOnly: readOnly,
//       decoration: InputDecoration(
//         prefixIcon: IconButton(
//           onPressed: onTapSearch ??
//               () {
//                 Get.to(() => const SearchScreen());
//               },
//           icon: const Icon(Icons.search),
//         ),
//         suffixIcon: GestureDetector(
//           onTap: onTapCamera,
//           child: const Icon(Icons.camera_alt_outlined),
//         ),
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(24)),
//         ),
//         hintText: 'search',
//         contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//       ),
//     );