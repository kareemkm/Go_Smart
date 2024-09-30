import 'dart:convert';

import 'package:dio/dio.dart';

import 'const.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.56.1:8000/api/',
        validateStatus: (status) => true,
          connectTimeout: Duration(milliseconds: 1300),
          receiveDataWhenStatusError: true,
          responseType:ResponseType.json ,
          contentType: 'application/json',
          headers: {
          'Authorization':'Bearer $token',
          "charset":"utf-8",
          }
    )
  );

  // Example method for making a GET request
  Future<dynamic> getData(String endpoint) async {
    try {
      Response response = await _dio.get(endpoint,);
      return response.data;
    } catch (e) {

      print('Error fetching data: $e');
      throw e; // You can handle exceptions in your UI code
    }
  }

// Add more methods for POST, PUT, DELETE, etc. as needed
  Future<dynamic> postData(String endpoint, Map? data) async {
    try {
      Response response = await _dio.post(endpoint,
          data: data );
      return response.data;
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // You can handle exceptions in your UI code
    }
  }
}