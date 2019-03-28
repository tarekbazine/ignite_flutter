import 'package:adliss/config/values.dart';
import 'package:adliss/pages/img_splashscreen.dart';
import 'package:adliss/pages/qr_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
//        Values.homeRoute: (BuildContext context) => AppLayout(),
//        Values.loginRoute: (BuildContext context) => LoginPage(),
        Values.qrRoute: (BuildContext context) => QrPage(),
      },
      home: ImgSplashScreen(),
    );
  }
}
