import 'dart:async';

import 'package:crmc_app/screens/FeedScreen.dart';
import 'package:crmc_app/screens/fourthDemoScreen.dart';
import 'package:crmc_app/screens/thirdDemoScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dealsScreen.dart';

/*
Made by 'pure coincidence', and sponsored by 'i keep googling things, and somehow it works'
*/

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexController = StreamController<int>.broadcast();
  int _currentTab = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void _onTap(int index) {
    setState(() {
      _currentTab = index;
      pageController.jumpToPage(index);
    });
  }

  //kinda logs out from the account, obviously! *,..,*
  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/')
        // we don't want to pop the screen, just replace it completely
        .then((_) => false);
  }

  @override
  Widget build(BuildContext context) {
    // Bootiful button, на всякий случай
    /*   final menuBtn = IconButton(
      color: Colors.deepPurple,
      icon: const Icon(FontAwesomeIcons.bars),
      onPressed: () {},
    );*/
    final signOutBtn = IconButton(
      icon: const Icon(FontAwesomeIcons.signOutAlt),
      color: Colors.white,
      onPressed: () => _goToLogin(context),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: signOutBtn,
        title: Text('CRM - Construction'),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) => indexController.add(index),
        controller: pageController,
        children: <Widget>[
          ClientsScreen(), // Первый экран с клиентами
          Contracts(), // Второй экран с договорами
          TestPage(), // For the future
          Class4(), // in case of emergency break Class
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        onTap: _onTap,
        activeColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.playlist_add_check,
              size: 25.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              size: 25.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}
