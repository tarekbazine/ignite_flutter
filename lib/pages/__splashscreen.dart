import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final int seconds;
  final Text title;
  final Color backgroundColor;
  final TextStyle styleTextUnderTheLoader;
  final dynamic navigateAfter;
  final double photoSize;
  final Function onClick;
  final Color loaderColor;
  final Image image;
  final Text loadingText;
  final ImageProvider imageBackground;
  final Gradient gradientBackground;

  final Function functionToWaitFor;
  final int minSeconds;

  final String navigateAfterAlternative;

  SplashScreen({
    this.loaderColor,
    this.seconds,
    this.minSeconds,
    this.functionToWaitFor,
    this.photoSize,
    this.onClick,
    this.navigateAfter,
    this.navigateAfterAlternative,
    this.title = const Text(''),
    this.backgroundColor = Colors.white,
    this.styleTextUnderTheLoader = const TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    this.image,
    this.loadingText = const Text(""),
    this.imageBackground,
    this.gradientBackground,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  bool _functionDone = false;
  bool _functionResultStatus = false;

  @override
  void initState() {
    super.initState();

    if (null != widget.functionToWaitFor) {
      print('function');
      _navigateAfterThis();
    } else if (null != widget.seconds) {
      print('seconds');

      _timer = Timer(Duration(seconds: widget.seconds), () {
        _navigateAfter();
      });
    } else {
      throw new ArgumentError(
          'you should provide either a callBackFunction or seconds for the splashscreen to wait for !');
    }
  }

  _navigateAfterThis() async {
    _timer = Timer(Duration(seconds: widget.minSeconds), () {
      if (_functionDone) _determinSecreenToNavigate();
    });

    _functionResultStatus = await widget.functionToWaitFor();

    _functionDone = true;

    if (!_timer.isActive) _determinSecreenToNavigate();
  }

  _determinSecreenToNavigate() {
    if (_functionResultStatus)
      _navigateAfter();
    else
      Navigator.of(context)
          .pushReplacementNamed(widget.navigateAfterAlternative);
  }

  _navigateAfter() {
    if (widget.navigateAfter is String) {
      // It's fairly safe to assume this is using the in-built material
      // named route component
      Navigator.of(context).pushReplacementNamed(widget.navigateAfter);
    } else if (widget.navigateAfter is Widget) {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) => widget.navigateAfter,
      ));
    } else {
      throw new ArgumentError(
          'widget.navigateAfter must either be a String or Widget');
    }
  }

  @override
  void dispose() {
    super.dispose();

    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new InkWell(
        onTap: widget.onClick,
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: widget.imageBackground == null
                    ? null
                    : new DecorationImage(
                        fit: BoxFit.cover,
                        image: widget.imageBackground,
                      ),
                gradient: widget.gradientBackground,
                color: widget.backgroundColor,
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  flex: 2,
                  child: new Container(
                      child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: new Container(child: widget.image),
                        radius: widget.photoSize,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                      widget.title
                    ],
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            widget.loaderColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      widget.loadingText
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
