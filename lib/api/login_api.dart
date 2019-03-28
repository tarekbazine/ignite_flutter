//import 'dart:async';
//import 'dart:convert';
//import 'package:algerien_lawyers/config/user_manager.dart';
//import 'package:algerien_lawyers/models/avocats.dart';
//
//import 'urls.dart';
//import 'package:http/http.dart' as http;
//
//enum LoginResponseStatus { success, unauthorized, error }
//
//class AuthApi {
//  static Future<LoginResponseStatus> authenticateUser(
//      String email, String password) async {
//    try {
//      final response = await http.post(
//        UrlManager.loginUrl,
//        body: json.encode({
//          'email': email,
//          'password': password,
//          'fcm_token': userManager.fcmToken
//        }),
//        headers: {
//          'Content-type': 'application/json',
//          'Accept': 'application/json'
//        },
//      );
//
////      print("tok ${ userManager.fcmToken}");
////      print("from server ${response.body.toString()}");
//
//      if (response.statusCode == 200) {
//        // Save Info
//        var response_ = json.decode(response.body);
////        print("token from server ${response_['access_token']}");
//        userManager.setUser(jsonAvocat: response_['user']);
//        userManager.token = response_['access_token'];
//
//        return LoginResponseStatus.success;
//      } else if (response.statusCode == 401) {
//        return LoginResponseStatus.unauthorized;
//      } else {
//        return LoginResponseStatus.error;
//      }
//    } catch (exception) {
//      print(exception);
////      if (exception.toString().contains('SocketException')) {
////         // TODO personalize messages
////      } else {
////      }
//      return LoginResponseStatus.error;
//    }
//  }
//}
