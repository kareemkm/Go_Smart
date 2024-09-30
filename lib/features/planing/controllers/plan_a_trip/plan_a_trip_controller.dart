import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/features/planing/screens/define_a_plan/define_a_plan.dart';
import 'package:go_smart/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/const.dart';
import '../../../../utils/constants/dio_helper.dart';
import '../../model/recomandition_model_ityourself.dart';

class PlanATripController extends GetxController {
  ApiService apiService = ApiService();
  late String selectedDate;
  int? isSelect = 1 ;

  late TextEditingController dateController;
  late TextEditingController nameController;
  late TextEditingController destinationController;
  late GlobalKey<FormState> formKey;

void ChangeSelect(int index){
  isSelect = index;
  update();
}

  toDefineAPlanScreen() {
    if (formKey.currentState!.validate()) {
      Get.off(
        () => DefineAPlanScreen(
          planName: destinationController.text,
        ),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    dateController = TextEditingController();
    nameController = TextEditingController();
    destinationController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  GetRecomandition(){
    print('============');
    apiService.getData("$Recomnditions city=${destinationController.text}&days=${dateController.text}").then((value) {
      print(value);
      recommendation = YourRecommendation.fromJson(value);
      print(recommendation);
      print('============');
      update();
    },).catchError((e){
      print(e);
    });

  }
}
