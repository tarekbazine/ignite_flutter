//import 'dart:convert';
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
////import 'package:fluttertoast/fluttertoast.dart';
////import 'package:flutter_email_sender/flutter_email_sender.dart';
//import 'package:url_launcher/url_launcher.dart';
//
//Future<List<Wilaya>> retrieveLocalParsedWilayas(context) async {
//  final json_ = await DefaultAssetBundle.of(context)
//      .loadString('assets/data/wilayas.json');
//
//  final parsed = json.decode(json_).cast<Map<String, dynamic>>();
//
//  var list_ = parsed.map<Wilaya>((json) => Wilaya.fromJson(json)).toList();
//  list_.insert(0, Wilaya(0, 'tous les wilayas'));
//
//  return list_;
//}
//
//void showToast(
//  String message,
//  Color color,
//) {
////  Toast.show("Toast plugin app", duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
//
////  Fluttertoast.showToast(
////      msg: message,
////      toastLength: Toast.LENGTH_SHORT,
////      gravity: ToastGravity.BOTTOM,
////      timeInSecForIos: 5,
////      backgroundColor: color,
////      textColor: Colors.white,
////      fontSize: 14.0);
//}
//
//void showSnackBar(
//    GlobalKey<ScaffoldState> key,
////  BuildContext context,
//    String message,
//    Color color,
//    {milliseconds: 4000}) {
//  final snackBar = SnackBar(
//    backgroundColor: color,
//    content: Text(message),
//    duration: Duration(milliseconds: milliseconds),
//  );
//
//  // Find the Scaffold in the Widget tree and use it to show a SnackBar
////  Scaffold.of(context).showSnackBar(snackBar);
//  key.currentState.showSnackBar(snackBar);
//}
//
//void showAlertDialog(context,
//    {String title = "",
//    String message = "",
//    onOkPressed = null,
//    onCancelPressed = null}) {
//  showDialog(
//      context: context,
//      barrierDismissible: false,
//      builder: (BuildContext context) {
//        return AlertDialog(
//          title: Center(child: Text('Alert')),
//          content: new Container(
//            constraints: BoxConstraints(maxHeight: 100.0),
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Text(
//                  message,
//                  textAlign: TextAlign.center,
//                  style: TextStyle(
//                    color: Values.primaryTextColor,
//                  ),
//                ),
//                Row(children: <Widget>[
//                  Expanded(
//                    child: FlatButton(
//                        child: Text('Annuler'),
//                        onPressed: () {
//                          Navigator.of(context).pop();
//                        }),
//                  ),
//                  Expanded(
//                    child: FlatButton(
//                        child: Text('Ok'),
//                        onPressed: () {
//                          onOkPressed();
//                          Navigator.of(context).pop();
//                        }),
//                  ),
//                ]),
//              ],
//            ),
//          ),
//        );
//      });
//}
//
//void sendEmail(String toMailId, {String subject, String body}) async {
////  final Email email = Email(
//////    body: 'Email body',
//////    subject: 'Email subject',
////    recipients: [toMailId],
//////    cc: ['cc@example.com'],
//////    bcc: ['bcc@example.com'],
//////    attachmentPath: '/path/to/attachment.zip',
////  );
////
////  await FlutterEmailSender.send(email);
//
//  var url = 'mailto:$toMailId?subject=$subject&body=$body';
//  if (await canLaunch(url)) {
//    await launch(url);
//  } else {
//    throw 'Could not launch email $url';
//  }
//}
