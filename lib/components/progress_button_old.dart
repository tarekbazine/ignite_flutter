import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressButton extends StatefulWidget {
  ProgressButton({Key key, this.title, this.onPressed, this.color})
      : super(key: key);

  final String title;
  final Color color;
  final VoidCallback onPressed;
  final double initWidth = double.infinity;


  @override
  _ProgressButtonState createState() => new _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  int _state = 0;
  Animation _animation;
  AnimationController _controller;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.infinity;

  bool _disabled = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
            color: !_disabled ? widget.color ?? Colors.blue : Colors.grey,
//            borderRadius: new BorderRadius.circular(50.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: new Offset(0.0, 1.0),
              ),
            ],
          ),
//          decoration: BoxDecoration(
//            boxShadow: Colors.black38,
//          ),
////          elevation: 5.0,
//
//          color: !_disabled ? widget.color ?? Colors.blue : Colors.grey,
//          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            key: _globalKey,
            height: 48.0,
            width: _width,
            child: new RaisedButton(
              padding: EdgeInsets.all(0.0),
              elevation: 4.0,
              color: Colors.blue,
              child: setUpButtonChild(),
              onPressed: _disabled
                  ? null
                  : () async {
                      setState(() {
                        if (_state == 0) {
                          animateButton();
                        }
                      });
                      (widget.onPressed() as Future).then(
                            (val) => setState(() {
                                  print('then');
                                  _state = 2;
                                  _disabled = false;
                                }), onError: (e) {
                          setState(() {
                            print('error login ${e.toString()}');
                            _state = 0;
                            _disabled = false;
                          });
                        }).timeout(Duration(seconds: 5), onTimeout: () => setState(() {
                          print('error login timeout');
                          _state = 0;
                          _disabled = false;
                        }));
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
    if (_state == 0) {

      if(widget.initWidth != _width){
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
    } else if (_state == 1) {
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

    setState(() {
      _disabled = true;
      _state = 1;
    });

  }


}
