import 'package:flutter/material.dart';

class SpecialTitle extends StatelessWidget {
  final String text;

  const SpecialTitle({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.0),
            ),
            Container(
              width: 75.0,
              height: 3.0,
              child: new Divider(
                color: Colors.greenAccent,
              ),
            )
          ]),
    );
  }
}
