import 'dart:convert';

import 'package:get/get.dart';
import 'package:go_smart/features/discover/models/all_hotels_model.dart';
import 'package:go_smart/features/discover/models/allcity_model.dart';
import 'package:go_smart/features/discover/models/landmarkmodel.dart';
import 'package:go_smart/features/discover/models/resturant_model.dart';
import 'package:go_smart/features/discover/screens/explore_category/model/one_city_model.dart';
import 'package:go_smart/features/discover/screens/explore_category/model/one_landmark_model.dart';
import 'package:go_smart/features/discover/screens/explore_category/model/one_resturant.dart';
import 'package:go_smart/utils/constants/dio_helper.dart';
import 'package:http/http.dart' as http;
import '../../../../../../utils/constants/const.dart';
import '../models/hotel_review_model.dart';
import '../models/landmark_review_model.dart';
import '../models/resturant_review_model.dart';
import '../screens/explore_category/model/one_hotel.dart';


class HomeController extends GetxController {
  ApiService apiService = ApiService();
  List<Citys> citys = [];
   GetAllCity(){
    citys = [];
    apiService.getData(Cities).then(
      (value) {
      var c = value.map((json) => Citys.fromJson(json)).toList();
       c.forEach((e){
        citys.add(e);
       });
        // print(citys);
        update();
      },
    ).catchError((e){
      print(e);
    });

  }

    OneCity? city = OneCity();
   GetOneCity(int id)async{

    await apiService.getData('$Cities/$id').then(
      (value) {
          city= OneCity.fromJson(value);
        update();
      },
    ).catchError((e){
      print(e);
    });

  }

  List<Resturants> resturant = [];
   GetAlresturant(){
    resturant = [];
    apiService.getData(Resturan).then(
      (value) {
      var c = value.map((json) => Resturants.fromJson(json)).toList();
       c.forEach((e){
        resturant.add(e);
       });
       print(resturant);
        update();
      },
    ).catchError((e){
      print(e);
    });

  }

   OneResturant? oneResturant = OneResturant() ;
   GetOneResturant(int id)async{

    await apiService.getData('$Resturan/$id').then(
      (value) {
          oneResturant= OneResturant.fromJson(value);
        update();
      },
    ).catchError((e){
      print(e);
    });

  }

  List<Landmarkss> landmark = [];
  GetAlllandmark(){
    landmark = [];
    apiService.getData(Landmarks).then(
          (value) {
        var c = value.map((json) => Landmarkss.fromJson(json)).toList();
        c.forEach((e){
          landmark.add(e);
        });
        print(landmark);
        update();
      },
    ).catchError((e){
      print(e);
    });
  }
  OneLandmark? oneLandmark = OneLandmark() ;
  GetOneLandmark(int id)async{
    await apiService.getData('$Landmarks/$id').then(
          (value) {
            oneLandmark= OneLandmark.fromJson(value);
            print(oneLandmark);
        update();
      },
    ).catchError((e){
      print(e);
    });

  }

  List<AllHotels> hotels = [];
   GetAllHotels(){
    hotels = [];
     apiService.getData(Hotels).then(
      (value) {
      var c = value.map((json) => AllHotels.fromJson(json)).toList();
       c.forEach((e){
         hotels.addIf(e.id! > 4, e);
       });
       print(hotels);
        update();
      },
    ).catchError((e){
      print(e);
    });

  }

  OneHotel? Onehotel = OneHotel();
   GetOneHotel(int id)async{
     print(id);
     await apiService.getData('$Hotels/$id').then(
      (value) {
        Onehotel= OneHotel.fromJson(value);
          update();
      },
    ).catchError((e){
      print(e);
    });

  }

  double? rate ;
   void changeRate(double value){
     rate = value;
     print(rate);
     update();
   }

   AddHotelreview({ required String comment, required int id}){
     apiService.postData("$AddHotelReview$id", {
       'rating': rate.toString()  ,
       'comment':comment
     }).then((value) async {
       print(value['message']);
       if(value['message'] ==  "Review added successfully."){
        await GetHotelreview(id: id);
        Get.back();
       }
       update();
     },).catchError((e){
       print(e);
     });
  }
  HotelReview hotelReview = HotelReview();
  GetHotelreview({ required int id}){
    print(id);
     hotelReview = new HotelReview();
    apiService.getData("$HotelReviews$id",).then((value) {
      print(value);
      hotelReview = HotelReview.fromJson(value);
      update();
    },).catchError((e){
      print(e);
    });
  }

  Addresturantreview({ required String comment, required int id}){
    apiService.postData("$AddResturantReview$id", {
      'rating': rate.toString()  ,
      'comment':comment
    }).then((value) async {
      print(value['message']);
      if(value['message'] ==  "Review added successfully."){
        await Getresturantreview(id: id);
        Get.back();
      }
      update();
    },).catchError((e){
      print(e);
    });
  }
  ResturantReview resturantReview = ResturantReview();
  Getresturantreview({ required int id}){
    apiService.getData("$ResturantReviews$id",).then((value) {
      print(value);
      resturantReview = ResturantReview.fromJson(value);
      print(resturantReview.resturant?.id);
      update();
    },).catchError((e){
      print(e);
    });
  }

  Addlandmarkreview({ required String comment, required int id}){
    apiService.postData("$AddLandmarkReview$id", {
      'rating': rate.toString()  ,
      'comment':comment
    }).then((value) async {
      print(value['message']);
      if(value['message'] ==  "Review added successfully."){
        await Getlandmarkreview(id: id);
        Get.back();
      }
      update();
    },).catchError((e){
      print(e);
    });
  }
  LandmarkReviews landmarkReview = LandmarkReviews();
  Getlandmarkreview({ required int id}){
    apiService.getData("$LandmarkReview$id",).then((value) {
      print(value);
      landmarkReview = LandmarkReviews.fromJson(value);
      print(landmarkReview);
      update();
    },).catchError((e){
      print(e);
    });
  }
}
