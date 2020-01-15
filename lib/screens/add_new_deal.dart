import 'package:flutter/material.dart';

class AddNewDeal extends StatefulWidget {
  @override
  _AddNewDealState createState() => _AddNewDealState();
}

class _AddNewDealState extends State<AddNewDeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('addNewDeal'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[Text('//TODO New Contract forms here')],
          ),
        ));
  }
}
