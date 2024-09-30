import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/utils/helpers/helper_functions.dart';

class PreBookingController extends GetxController {
  Rx<int> selectedDurationIndex = 0.obs;
  String selectedDuration = "";
  late String selectedDate;
  
  late TextEditingController dateController;
  setSelected(int radioIndex,String duration) {
    selectedDurationIndex.value = radioIndex;
    selectedDuration = duration;
  }

  showDatePicker(context) async {
    DateTime? picked = await CHelperFunctions.pickDate(context: context);
    selectedDate = CHelperFunctions.getFormattedDate(picked ?? DateTime.now(),format: "dd/MM/yyy");
    dateController.text = selectedDate;
  }

  @override
  void onInit() {
    super.onInit();
    dateController = TextEditingController();
  }
}
