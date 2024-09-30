import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:webview_flutter/webview_flutter.dart';


class web extends StatelessWidget {
  const web({Key? key, required this.url}) : super(key: key);
final String url ;
  @override
  Widget build(BuildContext context) {
    Uri urls = Uri.parse(url);
    var webcontroller = WebViewController()..loadRequest(urls)..platform
      ..setJavaScriptMode(JavaScriptMode.unrestricted)..addJavaScriptChannel(
        'messageHandler', onMessageReceived: (p0) {
        print(p0);
        var data = jsonDecode(p0.message);
        print(data['success']);
        if(data['success'] == false){
          Get.back();
        }
      },
      );
    return Scaffold(appBar: AppBar(),
        body:  WebViewWidget(
          controller: webcontroller..setNavigationDelegate(
           NavigationDelegate(

             onPageFinished: (url) async{
      await webcontroller.runJavaScriptReturningResult("document.documentElement.innerText").then((value) {
        print('=================================');
        var data = jsonDecode(value.toString());
        var dataSp = jsonDecode(data);
        print(dataSp["success"]);
        if(dataSp["success"] == 'false'){
          print('======');
          Navigator.pop(context);

        }
      });




      },
           )
          )


    ),
    );
  }
}