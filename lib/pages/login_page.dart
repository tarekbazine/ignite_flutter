//import 'package:algerien_lawyers/api/login_api.dart';
//import 'package:algerien_lawyers/components/empty_app_bar.dart';
//import 'package:algerien_lawyers/components/password_field.dart';
//import 'package:algerien_lawyers/components/progress_button.dart';
//import 'package:algerien_lawyers/config/global_translations.dart';
//import 'package:algerien_lawyers/config/locales.dart';
//import 'package:algerien_lawyers/config/values.dart';
//import 'package:flutter/material.dart';
//
//import 'package:validate/validate.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter/services.dart';
//
//DecorationImage _backgroundImage = new DecorationImage(
//  image: new AssetImage(Values.backgroundImage),
//  fit: BoxFit.cover,
//);
//
//DecorationImage _logoImage = new DecorationImage(
//  image: new ExactAssetImage(Values.logoImage),
//  fit: BoxFit.contain,
//);
//
//class LoginPage extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => new _LoginPageState();
//}
//
//class _LoginData {
//  String email = '';
//  String password = '';
//}
//
//class _LoginPageState extends State<LoginPage> {
//  final _formKey = GlobalKey<FormState>();
//
//  _LoginData _user = new _LoginData();
//  bool _autovalidate = false;
//  int _loadingBtn = 0;
//  bool _disableBtn = false;
//
//  Future _submit(context) async {
//    final form = _formKey.currentState;
//    if (!form.validate()) {
//      setState(() {
//        _autovalidate = true; // Start validating on every change.
//      });
//    } else {
//      form.save();
//      var response =
//          await AuthApi.authenticateUser(_user.email, _user.password);
//      if (LoginResponseStatus.success == response) {
//        Navigator.of(context).pushReplacementNamed(Values.homeRoute);
//        return true;
//      } else {
//        final _msg = (LoginResponseStatus.unauthorized == response)
//            ? 'Fausses informations ! \b SVP de les verifier'
//            : 'Ereur :( \b SVP de verifier votre connexion';
//
//        return showDialog<void>(
//          context: context,
//          barrierDismissible: false, // user must tap button!
//          builder: (BuildContext context) {
//            return AlertDialog(
//              title: Text(_msg),
//              content: SingleChildScrollView(
//                child: ListBody(
//                  children: <Widget>[
//                    // TODO Customize error message
////                  Text(responseJson['status']),
////                  Text(responseJson['body']),
//                  ],
//                ),
//              ),
//              actions: <Widget>[
//                FlatButton(
//                  child: Text('OK'),
//                  onPressed: () {
//                    Navigator.of(context).pop();
//                  },
//                ),
//              ],
//            );
//          },
//        );
//      }
//    }
//  }
//
//  String _validateEmail(String value) {
//    try {
//      Validate.isEmail(value);
//    } catch (e) {
//      return 'The E-mail Address must be a valid email address.';
//    }
//
//    return null;
//  }
//
//  // Add validate password function.
//  String _validatePassword(String value) {
//    if (value.length < 6) {
//      return 'The Password must be at least 8 characters.';
//    }
//
//    return null;
//  }
//
//  _launchURL() async {
//    const url = Values.avocatSubscribeWebUrl;
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//      statusBarColor: Values.primaryColor, //or set color with: Color(0xFF0000FF)
//    ));
//
//    final _loginFields = Form(
//      key: _formKey,
//      autovalidate: _autovalidate,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
//            child: Theme(
//              data: ThemeData(hintColor: Colors.white),
//              child: TextFormField(
//                initialValue: "",
////                initialValue: "sans.mail_13350@justice-algerie.com",
//                keyboardType: TextInputType.emailAddress,
//                decoration: InputDecoration(
//                  hintStyle: TextStyle(color: Colors.grey),
//                  hintText: "Enter votre @mail",
//                  labelText: "Email",
//                ),
//                validator: this._validateEmail,
//                onSaved: (String value) {
//                  this._user.email = value;
//                },
//              ),
//            ),
//          ),
//          Container(
//            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
//            child: Theme(
//              data: ThemeData(hintColor: Colors.white),
//              child: PasswordField(
//                  hintText: "Enter votre mot de pass",
//                  labelText: "Mot de pass",
//                  validator: this._validatePassword,
//                  onSaved: (String value) {
//                    this._user.password = value;
//                  }),
//            ),
//          ),
//          SizedBox(
//            height: 30.0,
//          ),
//          Container(
//              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
//              width: double.infinity,
//              child: ProgressButton(
//                  flat: false,
//                  loading: _loadingBtn,
//                  disabled: _disableBtn,
//                  title: AppLocalizations.of(context).text("login"),
//                  onPressed: () {
//                    print('sending');
//                    setState(() {
//                      _loadingBtn = 1;
//                      _disableBtn = true;
//                    });
//
//                    // Submit
//                    _submit(context).then((val) {
//                      if (val != null) {
//                        setState(() {
//                          print('then');
//                          _loadingBtn = 2;
//                          _disableBtn = true;
//                        });
//                      } else {
//                        setState(() {
//                          print('error login');
//                          _loadingBtn = 0;
//                          _disableBtn = false;
//                        });
//                      }
//                    }, onError: (e) {
//                      setState(() {
//                        print('error login ${e.toString()}');
//                        _loadingBtn = 0;
//                        _disableBtn = false;
//                      });
//                    });
////                        .timeout(Duration(seconds: 20),
////                        onTimeout: () =>
////                            setState(() {
////                              print('error login timeout');
////                              _loadingBtn = 0;
////                              _disableBtn = false;
////                            }));
//                  })),
//          SizedBox(
//            height: 25.0,
//          ),
//          InkWell(
//            child: Text(
//              "Vous n'avez pas de compte? s'inscrire",
//              style: TextStyle(
//                color: Colors.grey,
////                decoration: TextDecoration.underline,
//              ),
//            ),
//            onTap: _launchURL,
//          ),
//        ],
//      ),
//    );
//
//    final _loginHeader = Column(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: <Widget>[
//        Container(
//          width: 120.0,
//          height: 120.0,
//          decoration: new BoxDecoration(
//            image: _logoImage,
//          ),
//        ),
//        SizedBox(
//          height: 30.0,
//        ),
//        Text(
//          "Bienvenue sur ${AppLocalizations.of(context).text('app_name')}",
//          style: TextStyle(
//            fontWeight: FontWeight.w700,
//            color: Colors.white,
//          ),
//        ),
//        SizedBox(
//          height: 5.0,
//        ),
//        Text(
//          "Connecter pour continue",
//          style: TextStyle(color: Colors.grey),
//        ),
//      ],
//    );
//
//    final _loginBody = SingleChildScrollView(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[_loginHeader, _loginFields],
//      ),
//    );
//
//    return Scaffold(
//      appBar:  EmptyAppBar(),
//      backgroundColor: Colors.white,
//      body: Container(
//        decoration: new BoxDecoration(
//          image: _backgroundImage,
//        ),
//        child: Container(
//          decoration: new BoxDecoration(
//              gradient: new LinearGradient(
//            colors: <Color>[
//              const Color.fromRGBO(0, 153, 255, 0.6),
//              const Color.fromRGBO(51, 51, 63, 0.9),
//            ],
//            stops: [0.2, 1.0],
//            begin: const FractionalOffset(0.0, 0.0),
//            end: const FractionalOffset(0.0, 1.0),
//          )),
//          child: Center(
//            child: _loginBody,
//          ),
//        ),
//      ),
//    );
//  }
//}
