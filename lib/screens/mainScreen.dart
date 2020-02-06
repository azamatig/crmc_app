import 'dart:async';

import 'package:crmc_app/data/clientData.dart';
import 'package:crmc_app/data/contractData.dart';
import 'package:crmc_app/screens/fourthDemoScreen.dart';
import 'package:crmc_app/screens/thirdDemoScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) => indexController.add(index),
        controller: pageController,
        children: <Widget>[
          ShowClientData(), // Первый экран с клиентами, first Screen Clients List
          ShowContractData(), // Второй экран с договорами, second screen List Contracts
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
