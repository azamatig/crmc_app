import 'package:crmc_app/screens/loginScreen.dart';
import 'package:crmc_app/screens/mainScreen.dart';
import 'package:crmc_app/utilities/vars.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(MyApp());
}

Future<bool> sharePreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  langValue = preferences.getString("langValue");
  if (langValue == null) {
    await preferences.setString("langValue", "ru");
  }
  var res = (preferences.getBool("firstSingIn") ?? false);
  return res;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.orange,
          cursorColor: Colors.black,
          // fontFamily: 'SourceSansPro',
          textTheme: TextTheme(
            display2: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 45.0,
              // fontWeight: FontWeight.w400,
              color: Colors.orange,
            ),
            button: TextStyle(
              // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
              fontFamily: 'OpenSans',
            ),
            caption: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Colors.deepPurple[300],
            ),
            display4: TextStyle(fontFamily: 'Quicksand'),
            display3: TextStyle(fontFamily: 'Quicksand'),
            display1: TextStyle(fontFamily: 'Quicksand'),
            headline: TextStyle(fontFamily: 'NotoSans'),
            title: TextStyle(
              fontFamily: 'NotoSans',
              color: Colors.white,
              fontSize: 14,
            ),
            subhead: TextStyle(fontFamily: 'NotoSans'),
            body2: TextStyle(fontFamily: 'NotoSans'),
            body1: TextStyle(fontFamily: 'NotoSans'),
            subtitle: TextStyle(fontFamily: 'NotoSans'),
            overline: TextStyle(fontFamily: 'NotoSans'),
          ),
        ),
        home: LoginScreen(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => LoginScreen(),
          '/main': (BuildContext context) => MainScreen(),
        });
  }
}
