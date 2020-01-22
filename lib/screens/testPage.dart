import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  State createState() {
    return TestPageState();
  }
}

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Text('Demo screen 3'),
      ),
    ));
  }
}
