import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/common/widgets/text_fields/stadium_text_field.dart';
import 'package:go_smart/features/planing/controllers/plan_a_trip/plan_a_trip_controller.dart';
import 'package:go_smart/utils/constants/sizes.dart';

class PlanATripScreen extends StatelessWidget {
  const PlanATripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlanATripController controller = Get.put(PlanATripController());

    return Scaffold(
      appBar: const CAppBar(title: "plan a trip"),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                CStadiumTextField(
                  title: " please name your trip",
                  hintText: "name",
                  controller: controller.nameController,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "This field is required";
                  //   }
                  //   return null;
                  // },
                ),
                CStadiumTextField(
                  title: " select your City",
                  hintText: "search",
                  icon: const Icon(Icons.location_city),
                  controller: controller.destinationController,
                ),

                 CStadiumTextField(
                  controller: controller.dateController,
                    title: "Select Number of Days",
                    hintText: "Days",
                    icon: const Icon(Icons.view_day),
                ),
                const SizedBox(height: CSizes.spaceBtwSections * 2),
                CElevatedButton(
                  onPressed: () async{
                    await controller.GetRecomandition();
                    controller.toDefineAPlanScreen();
                  },
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                      horizontal: CSizes.defaultSpace),
                  child: const Text("Create plan "),
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
