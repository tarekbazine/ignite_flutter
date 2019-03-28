import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  Color color1;
  String text;
  Color color2;
  var onTap;

  ElevatedBtn({Key key, this.text, this.color1, this.color2, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child:
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Icon(
          Icons.person,
          color: Colors.white,
        ),
        Text(
          text,
          style: TextStyle(
              fontFamily: 'CaviarDreams',
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ]),
      color: Theme.of(context).accentColor,
      elevation: 4.0,
      splashColor: Colors.greenAccent,
      onPressed: onTap,
      padding: EdgeInsets.all(5.0),
    );
  }
}
