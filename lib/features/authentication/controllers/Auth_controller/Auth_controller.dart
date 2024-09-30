import 'dart:convert';

import 'package:get/get.dart';
import 'package:go_smart/utils/constants/dio_helper.dart';

import '../../../../utils/constants/const.dart';
import '../../screens/complete_your_profile/complete_your_profile.dart';
import '../../screens/permissions/notification_permission.dart';

class AuthController extends GetxController {
  Rx<bool> isChecked = false.obs;
  ApiService apiService = ApiService();

   login({required String email,required String password}){
    apiService.postData(Login, {
      'email':email,
      'password':password
    }).then((value) {
      token = value['token'];
      if(token != ''){
        Get.off(() => const CompleteYourProfileScreen());
      }
      print(token);
      update();
    },).catchError((e){
      print(e);
    });
  }

  register({required String email,required String password,required String name}){
    apiService.postData(Register, {
      'name':name,
      'email':email,
      'password':password
    }).then((value) {
      print(value);
      token = value['token'];
      if(token != ''){
        Get.offAll(() => const NotificationPermissionScreen());
      }
      print(token);
      update();
    },).catchError((e){
      print(e);
    });
  }

}