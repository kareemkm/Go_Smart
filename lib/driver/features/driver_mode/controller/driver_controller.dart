import 'package:get/get.dart';
import 'package:go_smart/driver/features/model/all_driver_model.dart';
import 'package:go_smart/features/payment/model/payment_model.dart';
import 'package:go_smart/utils/constants/dio_helper.dart';

import '../../../../utils/constants/const.dart';

class DriverController extends GetxController{
  ApiService apiService = ApiService();
  AllDriver allDriver = AllDriver();
  String? city ;
  String? phonePostel ;
  String? gender ;
  String? day  ;
  String? month ;
  String? year ;
  String? lang ;

  void ChangeCity(String? value){
    city = value!;
    update();
  }
  void ChangephonePostel(String? value){
    phonePostel = value!;
    update();
  }
  void Changegender(String? value){
    gender = value!;
    update();
  }
  void Changeday(String? value){
    day = value!;
    update();
  }
  void Changemonth(String? value){
    month = value!;
    update();
  }
  void Changeyear(String? value){
    year = value!;
    update();
  }
  void Changelang(String? value){
    lang = value!;
    update();
  }

  List<Datum>?  Driver ;
   getAllDriver(String? city){
    apiService.getData(drivers).then((value) {
      allDriver = AllDriver.fromJson(value);
      Driver = allDriver.data!
          .where((datum) => datum.city == city)
          .toList();
      print(AllDriver());
     update();
    },).catchError((e){print(e);});
  }

  void getAllcompeleteDriver(String image,
      String description,
      String name,
      String phoneNo,
      String contact_link,
      String car_type,

      ){
    apiService.postData(drivers,
        {    "image":image ,
           "city":"$city" ,
          "name": name,
          "phoneNo": "${phonePostel! + phoneNo}",
          "gender": "$gender",
          "year_of_birth": "$day / $month / $year",
          "contact_link": contact_link,
          "car_type": car_type,
          "language": lang,
          "description": description
        }).then((value) {
      print(value);
    },).catchError((e){print(e);});
  }
Payment payment = Payment();
   payments ()async{
    await apiService.postData(checkout,{}).then((value) {
       payment = Payment.fromJson(value);
       print(payment);
     },).catchError((e){
       print(e);
     });
  }


}