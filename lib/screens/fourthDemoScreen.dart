import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Class4 extends StatefulWidget {
  @override
  _Class4State createState() => _Class4State();
}

Future<bool> _goToLogin(BuildContext context) {
  return Navigator.of(context)
      .pushReplacementNamed('/')
      // we don't want to pop the screen, just replace it completely
      .then((_) => false);
}

class _Class4State extends State<Class4> {
  @override
  Widget build(BuildContext context) {
    final signOutBtn = IconButton(
      icon: const Icon(FontAwesomeIcons.signOutAlt),
      color: Colors.deepPurple,
      onPressed: () => _goToLogin(context),
    );
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text('CRMC')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: signOutBtn,
              ),
              Text('Выйти'),
            ],
          ),
        ));
  }
}
