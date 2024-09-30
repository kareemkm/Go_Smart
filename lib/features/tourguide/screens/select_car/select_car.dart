import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/common/widgets/appbars/appbar.dart';
import 'package:go_smart/features/tourguide/screens/request_booking/request_booking.dart';
import 'package:go_smart/common/widgets/list_tiles/car_type_tile.dart';
import 'package:go_smart/utils/constants/image_strings.dart';
import 'package:go_smart/utils/constants/sizes.dart';
import 'package:go_smart/utils/helpers/helper_functions.dart';

class SelectCarScreen extends StatelessWidget {
  const SelectCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CImages.map1),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(.2),
        appBar: const CAppBar(),
        body: SizedBox(
          height: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              padding: const EdgeInsets.only(top: CSizes.defaultSpace),
              height: CHelperFunctions.screenHeight(context) * .45,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  CCarTypeTile(
                      onTap: () {
                        Get.to(() => const RequestBookingScreen());
                      },
                      image: CImages.car1,
                      title: "Just go",
                      subtitle: "Near by you",
                      cost: r"$25.00",
                      duration: "2 min"),
                  CCarTypeTile(
                      onTap: () {},
                      image: CImages.car2,
                      title: "Limousine",
                      subtitle: "0.2 km",
                      cost: r"$80.00",
                      duration: "5 min"),
                  CCarTypeTile(
                      onTap: () {},
                      image: CImages.car3,
                      title: "ElectricCar",
                      subtitle: "0.45 km",
                      cost: r"$25.00",
                      duration: "2 min"),
                  CCarTypeTile(
                      onTap: () {},
                      image: CImages.car4,
                      title: "Taxi 4 seat",
                      subtitle: "0.5 km",
                      cost: r"$30.00",
                      duration: "4 min"),
                  CCarTypeTile(
                      onTap: () {},
                      image: CImages.car5,
                      title: "Taxi  7 seat",
                      subtitle: "0.67 km",
                      cost: r"$40.00",
                      duration: "4 min"),
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
