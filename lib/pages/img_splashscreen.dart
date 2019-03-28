import 'dart:async';

import 'package:adliss/config/values.dart';
import 'package:flutter/material.dart';

DecorationImage _img = new DecorationImage(
  image: new AssetImage(Values.splashscreenBackgroundImg),
  fit: BoxFit.contain,
);

class ImgSplashScreen extends StatefulWidget {
  @override
  _ImgSplashScreenState createState() => _ImgSplashScreenState();
}

class _ImgSplashScreenState extends State<ImgSplashScreen> {
  Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(Duration(seconds: 4), () {
      _navigateAfter();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          decoration: new BoxDecoration(
            image: _img,
          ),
        ),
        color: Values.splashscreenBackgroundColor,
      ),
    );
  }

  _navigateAfter() {
    Navigator.of(context).pushReplacementNamed(Values.qrRoute);
  }
}
