//import 'package:algerien_lawyers/utiles/helpers.dart';
//
//class WilayasManager{
//  List<Wilaya> _wilayas = [];
//
//  List<Wilaya> get all => _wilayas;
//
////  set wilayas(list) {
////    _wilayas = list;
////  }
//
//  loadWilayasList({context}) async{
//    _wilayas = await retrieveLocalParsedWilayas(context);
//  }
//
//  static final WilayasManager _singleton = new WilayasManager._internal();
//
//  factory WilayasManager() {
//    return _singleton;
//  }
//
//  WilayasManager._internal();
//}
//
//WilayasManager wilayasManager = WilayasManager();
//
//class Wilaya{
//
//  int _id;
//  String _name;
//
//  Wilaya(this._id, this._name);
//
//  String get name => _name;
//  int get id => _id;
//
//  set name(String value) {
//    _name = value;
//  }
//
//  set id(int value) {
//    _id = value;
//  }
//
//
//  factory Wilaya.fromJson(Map<String, dynamic> json) {
//    if (json == null) {
//      return null;
////      throw FormatException("Null JSON provided to SimpleObject");
//    }
//
//    return Wilaya(
//        int.parse(json["code"]),
//        json["nom"]);
//  }
//}
//
//
//
//class Commune{
//
//  int _id;
//  String _name_fr;
//  String _name_ar;
//
//  Commune(this._id, this._name_fr, this._name_ar);
//
//  String get name_fr => _name_fr;
//  String get name_ar => _name_ar;
//  int get id => _id;
//
//
//  factory Commune.fromJson(Map<String, dynamic> json) {
//    if (json == null) {
//      return null;
////      throw FormatException("Null JSON provided to SimpleObject");
//    }
//
//    return Commune(
//        json["id"],
//        json["name_fr"],
//        json["name_ar"]);
//  }
//}