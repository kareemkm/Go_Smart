import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/cards/tourguide_card.dart';
import 'package:go_smart/driver/features/driver_mode/controller/driver_controller.dart';
import 'package:go_smart/features/planing/screens/confirm_booking/tourguides_plan_confirm_booking.dart';
import 'package:go_smart/features/tourguide/screens/tourguide_profile/tourguide_profile.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';

import '../../../controllers/plan_a_trip/plan_a_trip_controller.dart';

class TourGuidesPlan extends StatelessWidget {
  const TourGuidesPlan({super.key});

  @override
  Widget build(BuildContext context) {
    //var CityController = Get.put(PlanATripController());
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder:(controller) =>  ListView.builder(
        shrinkWrap: true,
        itemCount: controller.Driver?.length ?? 0,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0),
          child: CTourGuideCard(
            title: controller.Driver?[index].name ?? '',
            subtitle: controller.Driver?[index].city ?? '',
            review: "(13 Review)",
            price: "15\$ per hour",
            isNetworkImage: true,
            image:controller.Driver?[index].image ?? '',
            rating: "4.2",
            onTapViewProfile: () {
              Get.to(TourguideProfileScreen(
                model: controller.Driver?[index] ?? [][index],
                image: CImages.tourguide1,
                onTapBookNow: () {
                  Get.to(() => const TourGuidesPlanConfirmBookingScreen());
                },
              ));
            },
          ),
        ),)
    );
  }
}
