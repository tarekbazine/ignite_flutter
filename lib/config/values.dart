import 'package:flutter/material.dart';
//import 'dart:ui';

class Values {
  //strings
  static const String appName = "Justice Algerie";

  //fonts
  static const String quickFont = "Quicksand";

  //images
  static const String imageDir = "assets/images";
  static const String splashscreenBackgroundImg= "$imageDir/splash.jpg";
  static const String logoImage = "$imageDir/logo/logo_white_writing.png";
  static const String logoImageColored = "$imageDir/logo/logo_color_writing.png";
  static const String myProfileBackgroundImage = "$imageDir/bg/profile_2.jpg";

  //colors
  static const primaryColor = Colors.blue;
  static const toastSuccesColor = Colors.green;
  static const toasDangerColor = Colors.red;
  static const backgroundColor = Color(0xFFEFEFEF);

  static const splashscreenBackgroundColor = Color(0xFFFE0000);


  static const inabaColors = [Color(0xFF42a5f5),
                              Color(0xFFFF5722),
                              Color(0xFF81C784)];


  //test color
  static const primaryTextColor = Color(0xFF212121);
  static const lightTextColor = Color(0xFF848484);



  //routes
  static const qrRoute = '/qr';
  static const homeRoute = '/home';
  static const loginRoute = '/login';

  //web url
  static const avocatSubscribeWebUrl = 'https://justice-algerie.com/fr/inscrire-comme-avocat';

}
