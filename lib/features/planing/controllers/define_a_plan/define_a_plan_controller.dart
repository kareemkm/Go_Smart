import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_smart/features/planing/model/recomandition_model.dart';
import 'package:go_smart/features/planing/screens/define_a_plan/widgets/plan_tourguides.dart';
import 'package:go_smart/features/planing/screens/define_a_plan/widgets/step_one_body.dart';
import 'package:go_smart/features/planing/screens/define_a_plan/widgets/step_three_body.dart';
import 'package:go_smart/features/planing/screens/define_a_plan/widgets/step_two_body.dart';
import 'package:go_smart/features/planing/shared/widgets/review_selection.dart';
import 'package:go_smart/utils/constants/dio_helper.dart';

import '../../../../utils/constants/const.dart';
import '../../model/recomandition_model_ityourself.dart';

class DefineAPlanController extends GetxController {
  int currentStep = 1;
  bool hideButtons = false;
  bool withTourguide = true;
  Widget currentScreen = const StepOneBody();
  List steps = [
    const StepOneBody(), //0
    const StepTwoBody(), //1
    const StepThreeBody(), //2
  ];
  void nextStep() {
    if (currentStep < 3) {
      currentStep++; //2
      currentScreen = steps[currentStep - 1];
      update();
    } else if (currentStep == 3) {
      currentStep = 4;
      update();
    }
  }

  void backStep() {
    if (currentStep != 1) {
      currentStep--;
      currentScreen = steps[currentStep - 1];
    }
    update();
  }

  void toReviewSelection() {
    hideButtons = true;
    currentScreen = const ReviewSelection();
    update();
  }

  void reload(){
    update();
  }

  void toPlanWithTourguide() {
    currentScreen =  TourGuidesPlan();
    update();
  }
  Dio dio =Dio();
  RecommendationAi recommendationAi = RecommendationAi();
   GetAiRecomandition(String city,String price,String days,String rating,)async{
     print('============');
     await dio.get('https://emadelsayed.pythonanywhere.com/recommend?rating=$rating&price=$price&days=$days&city=$city',
        ).then((value) {
       print(value);
      recommendationAi = RecommendationAi.fromJson(value.data);
      print(recommendationAi.recommendations);
       print('============');
      update();
        },).catchError((e){
          print(e);
    });
    
  }

}
