import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:go_smart/features/tourguide/screens/select_car/select_car.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class ChooseDestinationController extends GetxController {
  late TextEditingController destination;
  late GlobalKey<FormState> formKey;
  bool isLoading = false;
  Future<Position?> getCurrentLocation() async {
    try {
      PermissionStatus permissionStatus = await Permission.location.request();
      if (permissionStatus == PermissionStatus.granted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        return position;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  openGoogleMap() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      try {
        Position? current = await getCurrentLocation();

        //? text to lat and long
        List<Location> locations =
            await locationFromAddress(destination.text);
        Location dest = locations.first;

        //? open external google map with drawing poly line from current location to destination
        String url =
            "https://www.google.com/maps/dir/${current?.latitude},${current?.longitude}/${dest.latitude},${dest.longitude}/";
        await launchUrl(
          Uri.parse(url),
        );
        Get.to(()=> const SelectCarScreen());

      } catch (e) {
        Get.showSnackbar(
          const GetSnackBar(
            title: "error",
            message: "wrong destination",
            duration: Duration(seconds: 3),
          ),
        );
      }
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    destination = TextEditingController();
    formKey = GlobalKey<FormState>();
  }
}
