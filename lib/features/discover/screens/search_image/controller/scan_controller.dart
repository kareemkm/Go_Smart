import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:go_smart/utils/constants/const.dart';

class ScanController extends GetxController {
  Dio dio = Dio();
   Scan (File? image)async{
     var formdata = FormData.fromMap({
       'image' : await MultipartFile.fromFile(image!.path)
     });
    await dio.post('https://app-host-g63s.onrender.com/scan',
    data: formdata
    ).then((value) {
      print(value);
      scan_reault = value.data['scanning'];
    },).catchError((e){print(e);});

  }
}