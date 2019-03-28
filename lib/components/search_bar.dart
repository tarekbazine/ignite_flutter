//import 'package:algerien_lawyers/config/locales.dart';
//import 'package:flutter/material.dart';
//
//class SearchBar extends StatelessWidget {
//  final Function onChanged;
//  final TextEditingController controller;
//
//  SearchBar({@required this.onChanged, this.controller});
//
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      padding: new EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
//      margin: const EdgeInsets.only(bottom: 4),
//      child: new Material(
//        borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
//        elevation: 2.0,
//        child: new Container(
//          height: 45.0,
//          margin: new EdgeInsets.only(left: 16.0, right: 16.0),
//          child: new Row(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              new Expanded(
//                child: new TextField(
//                  maxLines: 1,
//                  decoration: new InputDecoration(
//                    icon: Icon(
//                      Icons.search,
//                      color: Theme.of(context).accentColor,
//                    ),
//                    hintText:
//                        '${AppLocalizations.of(context).text("search")} ...',
//                    border: InputBorder.none,
//                    suffixIcon: controller.text.isNotEmpty
//                        ? IconButton(
//                            icon: Icon(Icons.close),
//                            onPressed: () {
//                              controller.clear();
//                            },
//                          )
//                        : Container(width: 0.0, height: 0.0),
//                  ),
//                  onChanged: onChanged,
//                  controller: controller,
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
