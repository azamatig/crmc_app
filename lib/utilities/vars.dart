import 'dart:io';

import 'package:flutter/material.dart';

String langValue;
String restApiUrl = "http://192.168.88.100:8078/crmc/rest/";
String aToken;
String userId;

String connectionTimeCode = "CONNECTION_TIME_OUT";
String accessError = "ACCESS_ERROR";

Widget errorAlertDialog(var context, String title, String content) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.circular(12.0)),
    titleTextStyle: Theme.of(context).textTheme.title,
    contentTextStyle: Theme.of(context).textTheme.subhead,
    actions: <Widget>[
      ButtonTheme(
        minWidth: 50.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Theme.of(context).accentColor)),
        child: MaterialButton(
          color: Theme.of(context).accentColor,
          disabledColor: Color(0xB1B0AF),
          disabledElevation: 1,
          disabledTextColor: Colors.black,
          child: Text(
            'close',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      )
    ],
  );
}

Widget waitingScreen(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(color: Colors.deepPurple),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: CircularProgressIndicator(
        semanticsLabel: "Ожидание",
        backgroundColor: Colors.white,
      )),
    ),
  );
}

// ignore: missing_return
Future<bool> checkConnection() async {
  try {
    final result = await InternetAddress.lookup('192.168.88.101:8078/crmc');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}

const BorderRadiusGeometry BORDER_RADIUS =
    BorderRadius.all(Radius.circular(8.0));
const EdgeInsets SMALL_INSESTS = EdgeInsets.all(8.0);
const EdgeInsets DEFAULT_INSESTS = EdgeInsets.all(16.0);
