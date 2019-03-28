//import 'dart:convert';
//
//import 'package:algerien_lawyers/config/values.dart';
//import 'package:algerien_lawyers/models/avocats.dart';
//import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:async';
//
//class UserManager {
//  SharedPreferences _prefs;
//  final _storageKey = "${Values.appName}_";
//  Future<SharedPreferences> _sharedPreferencesFuter =
//      SharedPreferences.getInstance();
//
//  Avocat _user;
//  String _token;
//  String fcmToken;
//
//  Avocat get user => _user;
//  String get token => _token;
//
//  set user(Avocat avocat) {
//    _user = avocat;
//  }
//
//  setUser({Map jsonAvocat}) {
////    print(jsonAvocat.toString()); //todo
//
//    setUserInfo(json.encode(jsonAvocat));
//    _user = Avocat.fromJson(jsonAvocat);
//  }
//
//  set token(String value) {
//    _token = value;
//    setAccesToken(value);
//  }
//
//  logout(BuildContext context) {
//    Navigator.of(context).pushNamedAndRemoveUntil(
//        Values.loginRoute, (Route<dynamic> route) => false);
//
//    _user = _token = null;
//
//    //todo clear persisted user data
//    setUserInfo(null);
//    setAccesToken(null);
//  }
//
//  Future<bool> loadPersistedUser() async {
//    final token = await getAccesToken();
//    final user = await getUserInfo();
//
//    print("loaded " + user.toString());
//    print("loaded " + token);
//
//    if ('' == token && '' == user) {
//      return false;
//    }
//
//    _user = Avocat.fromJson(user);
//    _token = token;
//
//    return true;
//  }
//
//  /// ----------------------------------------------------------
//  /// Method that saves/restores user info
//  /// ----------------------------------------------------------
//  getAccesToken() async {
//    return await _getSavedInfo('acces_token');
//  }
//
//  getUserInfo() async {
//    final user = await _getSavedInfo('user');
//    return '' == user ? '' : json.decode(user);
//  }
//
//  setAccesToken(String token) async {
//    return await _setSavedInfo('acces_token', token);
//  }
//
//  setUserInfo(String userInfo) async {
//    return await _setSavedInfo('user', userInfo);
//  }
//
//  ///
//  /// Application Preferences related
//  ///
//  /// ----------------------------------------------------------
//  /// Generic routine to fetch an application preference
//  /// ----------------------------------------------------------
//  Future<String> _getSavedInfo(String name) async {
//    if (_prefs == null) _prefs = await _sharedPreferencesFuter;
//
//    return _prefs.getString(_storageKey + name) ?? '';
//  }
//
//  /// ----------------------------------------------------------
//  /// Generic routine to saves an application preference
//  /// ----------------------------------------------------------
//  Future<bool> _setSavedInfo(String name, String value) async {
//    if (_prefs == null) _prefs = await _sharedPreferencesFuter;
//
//    return _prefs.setString(_storageKey + name, value);
//  }
//
//  ///
//  /// Singleton Factory
//  ///
//  static final UserManager _manager = new UserManager._internal();
//
//  factory UserManager() {
//    return _manager;
//  }
//
//  UserManager._internal();
//}
//
//UserManager userManager = new UserManager();
