//import 'dart:async';
//import 'dart:convert';
//import 'package:algerien_lawyers/config/user_manager.dart';
//import 'package:algerien_lawyers/config/values.dart';
//import 'package:algerien_lawyers/models/inabas.dart';
//import 'package:algerien_lawyers/models/wilayas.dart';
//import 'package:flutter/cupertino.dart';
//
//import 'urls.dart';
//import 'package:http/http.dart' as http;
//
//class CommunesApi {
//  static List<Commune> parseCommunes(String responseBody) {
//    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//    var list_ = [];
//    if(parsed != null){
//      list_ =  parsed.map<Commune>((json) => Commune.fromJson(json)).toList();
//      list_.insert(0,Commune(0, '', ''));
//    }
//    return list_;
//  }
//
////  static Map<String, String> _getHeaders() {
////    return {
////      "Authorization": "${userManager.token}",
////      "Accept": "application/json"
////    };
////  }
//
//
//  static Future<List<Commune>> getCommunes(int codeWilaya) async {
//    // Make a HTTP GET request
//    // Await basically pauses execution until the get() function returns a Response
//    try {
//      var url = UrlManager.communesUrl + "/${codeWilaya}";
//      print(url);
//
//      http.Response response = await http.get(
//        url
//      );
//
//      if (response.statusCode == 200) {
////        print(response.body);
//        return parseCommunes(response.body);
//      } else {
//        return [];
//      }
//    } on Exception catch (_) {
//      return [];
//    }
//  }
//}
