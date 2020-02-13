import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:crmc_app/data/clientData.dart';
import 'package:crmc_app/data/contractData.dart';
import 'package:crmc_app/screens/fourthDemoScreen.dart';
import 'package:crmc_app/screens/hidden_menu_page.dart';
import 'package:crmc_app/screens/thirdDemoScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*
Made by 'pure coincidence', and sponsored by 'i keep googling things, and somehow it works'
*/

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController(initialPage: 0);
  int _currentTab = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        child: Icon(
          FontAwesomeIcons.hamburger,
          color: Colors.white,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => HiddenMenuPage())),
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() => _currentTab = index);
        },
        controller: pageController,
        children: <Widget>[
          ShowClientData(), // Первый экран с клиентами, first Screen Clients List
          ShowContractData(), // Второй экран с договорами, second screen List Contracts
          TestPage(), // For the future
          Class4(), // in case of emergency break Class
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentTab,
        showElevation: true,
        onItemSelected: _onTap,
        items: [
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: Text(
              'Клиенты',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            activeColor: Colors.deepPurple,
            inactiveColor: Colors.black,
            icon: Icon(
              FontAwesomeIcons.users,
              size: 20.0,
              color: Colors.black,
            ),
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: Text(
              'Договоры',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            activeColor: Colors.deepPurple,
            inactiveColor: Colors.black,
            icon: Icon(
              FontAwesomeIcons.fileSignature,
              size: 20.0,
              color: Colors.black,
            ),
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: Text(
              'Демо',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            activeColor: Colors.deepPurple,
            inactiveColor: Colors.black,
            icon: Icon(
              FontAwesomeIcons.clone,
              size: 20.0,
              color: Colors.black,
            ),
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: Text(
              'Настройки',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            activeColor: Colors.deepPurple,
            inactiveColor: Colors.black,
            icon: Icon(
              FontAwesomeIcons.cogs,
              size: 20.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
