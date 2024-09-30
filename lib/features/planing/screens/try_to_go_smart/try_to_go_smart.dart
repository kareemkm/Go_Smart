import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/common/widgets/buttons/elevated_button.dart';
import 'package:go_smart/features/planing/screens/go_smart_no_guide/no_guide.dart';
import 'package:go_smart/common/widgets/text_fields/stadium_text_field.dart';
import 'package:go_smart/features/planing/shared/widgets/question_and_two_radio_buttons.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:go_smart/utils/helpers/helper_functions.dart';

import '../../controllers/define_a_plan/define_a_plan_controller.dart';
import '../go_smart_with_guide/with_guide.dart';

class TryToGoSmartScreen extends StatefulWidget {
  const TryToGoSmartScreen({super.key});

  @override
  State<TryToGoSmartScreen> createState() => _TryToGoSmartScreenState();
}
TextEditingController name =TextEditingController();
TextEditingController rate =TextEditingController();
TextEditingController price =TextEditingController();
TextEditingController city =TextEditingController();
TextEditingController days =TextEditingController();

class _TryToGoSmartScreenState extends State<TryToGoSmartScreen> {
  bool withTourguide = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DefineAPlanController>(
      init: DefineAPlanController(),
      builder:(controller) =>  Scaffold(
        appBar: const CAppBar(title: "Plan a trip"),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                   CStadiumTextField(
                    controller: name,
                    title: " please name your trip",
                    hintText: "name",
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return "This field is required";
                    //   }
                    //   return null;
                    // },
                  ),
                   CStadiumTextField(
                    controller: city,
                    title: " select your city",
                    hintText: "City",
                    icon: Icon(Icons.location_city),
                  ),
                  CStadiumTextField(
                    controller: days,
                    title: " days",
                    icon: const Icon(Icons.view_day), hintText: 'entre number of days',

                  ),
                  CStadiumTextField(
                    controller: rate,
                    title: " Rate",
                    icon: const Icon(Icons.star_rate), hintText: 'entre rateing',

                  ),
                  CStadiumTextField(
                    controller: price,
                    title: " budget",
                    icon: const Icon(Icons.monetization_on_outlined), hintText: 'entre budget',

                  ),

                  const SizedBox(height: CSizes.spaceBtwItems),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CSizes.defaultSpace),
                    child: CQuestionWithTwoRadioButtons(
                      question:
                          "Would you be interested in adding a personalized tour guide to your trip?",
                      onYesSelected: () {
                        setState(() {
                          withTourguide = true;
                        });
                      },
                      onNoSelected: () {
                        setState(() {
                          withTourguide = false;
                        });
                      },
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections),
                  CElevatedButton(
                    onPressed: () async{
                      await controller.GetAiRecomandition(city.text, price.text, days.text, rate.text);
                      Get.to(() => withTourguide
                          ?  GoSmartWithGuideScreen(
                              cityName: city.text,
                            )
                          :  GoSmartNoGuideScreen(cityName:  name.text));
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
      ),
    );
  }
}
