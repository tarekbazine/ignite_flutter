import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressButton extends StatefulWidget {
  ProgressButton({Key key, this.loading, this.disabled, this.title, this.onPressed, this.color, this.flat})
      : super(key: key);


  final int loading;
  final bool disabled;
  final String title;
  final Color color;
  final bool flat;
  final VoidCallback onPressed;
  final double initWidth = double.infinity;


  @override
  _ProgressButtonState createState() => new _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
//  int widget.loading = 0;
  Animation _animation;
  AnimationController _controller;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.infinity;

//  @override
//  void dispose() {
//    super.dispose();
//    _controller.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: new Container(
          decoration: new BoxDecoration(
            color: !widget.disabled ? widget.color ?? Colors.blue : Color(0xFFf6f8fa),
//            borderRadius: new BorderRadius.circular(50.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: widget.flat? Colors.transparent : Colors.black38,
                blurRadius: 10.0,
                offset: new Offset(0.0, 1.0),
              ),
            ],
          ),
          child: Container(
            key: _globalKey,
            height: 48.0,
            width: _width,
            child: new RaisedButton(
              padding: EdgeInsets.all(0.0),
              elevation: !widget.flat? 4.0:0.0,
              color: Colors.blue,
              child: setUpButtonChild(),
              onPressed: widget.disabled
                  ? null
                  : () {
//                          animateButton();
                          widget.onPressed();
                        },
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///
  setUpButtonChild() {
    if (widget.loading == 0) {

      if(widget.initWidth != _width){
        print('100%');
        setState(() {
          _width = widget.initWidth;
        });
      }

      return new Text(
        widget.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (widget.loading == 1) {
      return SizedBox(
        height: 36.0,
        width: 36.0,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    double initialWidth = _globalKey.currentContext.size.width;
    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - 48.0) * _animation.value);
        });
      });
    _controller.forward();
  }


}
