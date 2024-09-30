import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/features/tourguide/controller/choose_destination/choose_destination_controller.dart';
import 'package:go_smart/features/tourguide/screens/type_destination/widgets/destination_text_field.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class TypeDestinationScreen extends StatelessWidget {
  const TypeDestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseDestinationController());
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CImages.map1),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CAppBar(),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(
              left: CSizes.defaultSpace,
              right: CSizes.defaultSpace,
              bottom: CSizes.spaceBtwSections),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DestinationTextField(controller: controller.destination,hintText: "Type your Destination"),
                GetBuilder<ChooseDestinationController>(
                  init: controller,
                  builder: (controller) => controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CElevatedButton(
                          onPressed: () async => controller.openGoogleMap(),
                          width: double.infinity,
                          child: const Text("Apply"),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
