//import 'dart:async';
//import 'package:algerien_lawyers/config/user_manager.dart';
//import 'package:algerien_lawyers/config/values.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:http/http.dart' as http;
//
//
//class Api {
//
//
//  static Future request(String url, Function onSuccess, BuildContext context,
//      {String method, data}) async {
//    try {
//
//    final client = http.Client();
//
//      if (method == null) {
//        method = 'GET';
//      }
//
//
//      final request = http.Request(method, Uri.parse(url));
//      request.headers
//          .putIfAbsent("Authorization", () => "${userManager.token}");
//      request.headers.putIfAbsent("Accept", () => "application/json");
//
//      if (method != "GET") {
//        request.body = data;
//      }
//
//      await client.send(request).then((response) {
//        print("response");
//        print(response.toString());
//        if (response.statusCode == 200) {
//          return onSuccess(response);
//        } else if (response.statusCode == 401) {
//          Navigator.of(context).pushNamedAndRemoveUntil(
//              Values.loginRoute, (Route<dynamic> route) => false);
//        } else {
//          print("error");
//        }
//        return [];
//      });
//
//      //error
//    } on Exception catch (_) {
//      print("error global");
//      return [];
//    }
//  }
//}
