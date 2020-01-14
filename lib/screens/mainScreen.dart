import 'package:crmc_app/screens/feedScreen.dart';
import 'package:crmc_app/screens/fourthScreen.dart';
import 'package:crmc_app/screens/secScreen.dart';
import 'package:crmc_app/screens/thridScreen.dart';
import 'package:crmc_app/utilities/TransitionRouteObserver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/MainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  final routeObserver = TransitionRouteObserver<PageRoute>();

  static const headerAniInterval =
      const Interval(.1, .3, curve: Curves.easeOut);
  Animation<double> _headerScaleAnimation;
  AnimationController _loadingController;

  @override
  void initState() {
    super.initState();
    MyHomePage();
    Contracts();
    _pageController = PageController();
    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );
    _headerScaleAnimation =
        Tween<double>(begin: .6, end: 1).animate(CurvedAnimation(
      parent: _loadingController,
      curve: headerAniInterval,
    ));
  }

  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  int _currentTab = 0;
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
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
        controller: _pageController,
        children: <Widget>[
          MyHomePage(),
          Contracts(),
          Class3(),
          Class4(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });

          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
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
