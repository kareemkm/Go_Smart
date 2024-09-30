import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/styles/text_styles.dart';
import 'package:go_smart/common/widgets/containers/circular_container.dart';
import 'package:go_smart/common/widgets/text_fields/text_field_with_title.dart';
import 'package:go_smart/driver/features/driver_mode/controller/driver_controller.dart';
import 'package:go_smart/driver/features/driver_mode/screens/profile/widget/language_dropdown.dart';
import 'package:go_smart/features/authentication/screens/complete_your_profile/widgets/birthdate_dropdowns.dart';
import 'package:go_smart/features/authentication/screens/complete_your_profile/widgets/gender_dropdown.dart';
import 'package:go_smart/features/authentication/screens/complete_your_profile/widgets/phone_number_text_field.dart';
import 'package:go_smart/utils/constants/colors.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import '../../../../../common/widgets/buttons/elevated_button.dart';

class DriverCompleteProfileScreen extends StatelessWidget {
  const DriverCompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name =TextEditingController();
    TextEditingController phone =TextEditingController();
    TextEditingController content =TextEditingController();
    TextEditingController description =TextEditingController();
    TextEditingController car =TextEditingController();

    return GetBuilder<DriverController>(
      init: DriverController(),
      builder:(controller) =>  Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //? title and subtitle
                    const Text("Complete Your Profile",
                        style: CTextStyles.textStyle24),
                    const SizedBox(height: CSizes.spaceBtwItems),
                    Text(
                      "don’t worry only you can see or edit your personal data",
                      style: CTextStyles.textStyle16
                          .copyWith(color: CColors.darkGrey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: CSizes.spaceBtwItems),

                    //? icon with circular grey background
                    CCircularContainer(child: SvgPicture.asset(CImages.account,height: 45,)),
                    const SizedBox(height: CSizes.spaceBtwItems),
                     CTextFieldWithTitle(
                       controller: name,
                        hintText: "ex:Ahmed", title: "Name"),
                    const SizedBox(
                      height: CSizes.spaceBtwItems,
                    ),
                      CLanguageDropDown(
                        selectedValue: controller.city,
                        onChandge: (p0) {
                          controller.ChangeCity(p0);
                        },
                      Title: "City",
                      hint: "select",
                      item: [
                        'Cairo',
                        'Alexandria',
                        'Giza',
                        'Shubra El Kheima',
                        'Port Said',
                        'Suez',
                        'Luxor',
                        'al-Mansura',
                        'El-Mahalla El-Kubra',
                        'Tanta',
                        'Asyut',
                        'Ismailia',
                        'Faiyum',
                        'Zagazig',
                        'Damietta',
                        'Aswan',
                        'Minya',
                        'Damanhur',
                        'Beni Suef',
                        'Qena',
                        'Sohag',
                        'Hurghada',
                        '6th of October City',
                        'Shibin El Kom',
                        'Banha',
                        'Kafr El Sheikh',
                        'Arish',
                        'Mallawi',
                        '10th of Ramadan City',
                        'Bilbeis'
                      ],
                    ),
                    const SizedBox(height: CSizes.spaceBtwInputFields),

                    //? phone number drop down with text field
                     CPhoneNumberTextField(
                       controller: phone,
                      onChandge: (p0) {
                         controller.ChangephonePostel(p0);

                      },
                      selectedValue: controller.phonePostel,
                    ),
                    const SizedBox(
                      height: CSizes.spaceBtwInputFields,
                    ),

                    //? gender drop down
                     CGenderDropDown(
                      onChandge: (p0) {
                        controller.Changegender(p0);
                      },
                      selectedValue: controller.gender ,
                    ),
                    const SizedBox(
                      height: CSizes.spaceBtwInputFields,
                    ),

                    //? birth date dropdowns
                     CBirthDateDropDowns(
                       onChandgeDay: (p0) {
                         controller.Changeday(p0);

                       },
                       onChandgemonth: (p0) {
                         controller.Changemonth(p0);


                       },
                       onChandgeyear: (p0) {
                         controller.Changeyear(p0);

                       },
                       selectedValueDay: controller.day,
                       selectedValuemonth:controller.month ,
                       selectedValueyear:controller.year ,

                    ),
                    const SizedBox(
                      height: CSizes.spaceBtwItems,
                    ),
                    CTextFieldWithTitle(
                        controller: car,
                        hintText: "KiA", title: "CarType"),
                    const SizedBox(
                      height: CSizes.spaceBtwItems,
                    ),
                     CTextFieldWithTitle(
                      controller: content,
                        hintText: "example.com", title: "Contact Link"),
                    const SizedBox(
                      height: CSizes.spaceBtwItems,
                    ),
                      CLanguageDropDown(
                        selectedValue: controller.lang,
                       onChandge: (p0) {
                         controller.Changelang(p0);
                       },
                      Title: "Language",
                      hint: "select",
                      item: ["English", "Arabic"],
                    ),
                    const SizedBox(
                      height: CSizes.spaceBtwItems,
                    ),
                     CTextFieldWithTitle(
                      controller: description,
                      hintText: "",
                      title: "Write about Your self",
                      maxLines: 2,
                    ),
                    const SizedBox(height: CSizes.spaceBtwSections),
                    CElevatedButton(
                      onPressed: () {
                        controller.getAllcompeleteDriver('image', description.text, name.text, phone.text, content.text, car.text
                        );

                      },
                      width: double.infinity,
                      margin:
                      const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
                      child: const Text("Submit"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
