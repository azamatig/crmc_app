import 'package:crmc_app/main.dart';
import 'package:crmc_app/services/auth.dart';
import 'package:crmc_app/utilities/vars.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode myFocusNode;

  final formKey = GlobalKey<FormState>();
  String _login;
  String _password;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: sharePreferences(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null &&
              snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: Colors.deepPurple,
              resizeToAvoidBottomPadding: false,
              body: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.15 -
                                  50),
                          height: MediaQuery.of(context).size.height * 0.33,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 60.0, 0.0, 0.0),
                                child: Image.asset(
                                  "assets/images/uco.png",
                                  fit: BoxFit.cover,
                                  height: 65,
                                  width: 65,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  "CRMC UCO",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 290,
                    width: 320,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 25,
                      child: Container(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 12, 20, 10),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    "Введите логин и пароль",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  onSaved: (String val) {
                                    _login = val;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    fillColor: Colors.deepPurple[50],
                                    filled: true,
                                    prefixIcon: Icon(Icons.person_pin),
                                    labelText: "Логин",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.020,
                                        horizontal: 15.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                    ),
                                  ),
                                  onFieldSubmitted: (String value) {
                                    FocusScope.of(context)
                                        .requestFocus(myFocusNode);
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  onSaved: (String val) {
                                    _password = val;
                                  },
                                  focusNode: myFocusNode,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    fillColor: Colors.deepPurple[50],
                                    filled: true,
                                    prefixIcon: Icon(Icons.security),
                                    labelText: "Пароль",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.020,
                                        horizontal: 15.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  child: GestureDetector(
                                      onTap: () {
                                        print("Login pressed");
                                        _onLogin();
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.055,
                                        width: 125,
                                        decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "ВОЙТИ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        });
  }

  void _onLogin() async {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      showDialog(
          context: context,
          builder: (BuildContext context) => waitingScreen(context));
      var client = await Auth().authenticationRest(
        _login,
        _password,
      );
      if (client == accessError) {
        Navigator.of(context).pop();
        //Pops up error top bar and discards it after duration time
        Flushbar(
          title: "Ошибка авторизации",
          message:
              "Не правильный пароль или логин, пожалуйста проверьте введенные данные",
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
          boxShadows: [
            BoxShadow(
              color: Colors.red[800],
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0,
            )
          ],
        )..show(context);
        return;
      }
      if (client == connectionTimeCode) {
        Navigator.of(context).pop();
        Flushbar(
          title: "Превышено время ожидания",
          message:
              "Превышено время ожидания ответа от сервера, пожалуйста попробуйте позднее",
          backgroundColor: Colors.orangeAccent,
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 3),
          boxShadows: [
            BoxShadow(
              color: Colors.yellow[800],
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0,
            )
          ],
        )..show(context);
        return;
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/main', ModalRoute.withName('/'));
      }
    }
  }

  void badLogin(String title, String subtitle) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return errorAlertDialog(context, title, subtitle);
        });
  }
}
