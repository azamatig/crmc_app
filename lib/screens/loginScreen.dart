import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'mainScreen.dart';

const users = const {
  'test': '12345',
  'hunter': 'hunter',
};

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Логин: ${data.name}, Пароль: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Пользователь не существует';
      }
      if (users[data.name] != data.password) {
        return 'Не правильный пароль';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Имя: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Пользователь не существует';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        title: 'crmc',
        logo: 'assets/images/uco.png',
        onLogin: _authUser,
        onSignup: _authUser,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MainScreen(),
          ));
        },
        onRecoverPassword: _recoverPassword,
        messages: LoginMessages(
          usernameHint: 'Логин',
          passwordHint: 'Пароль',
        ));
  }
}
