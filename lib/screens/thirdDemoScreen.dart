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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('CRMC'),
      ),
      body: Center(
        child: Container(
          child: Text('Placeholder Screen'),
        ),
      ),
    );
  }
}
