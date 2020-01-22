/*
xxx: Я как-то видел мужика, который себе в бане соорудил купе поезда.
С полками, столиком - всё как положено. Вместо окна - большой телевизор
@bash.im
*/
import 'package:crmc_app/data/clientData.dart';
import 'package:crmc_app/screens/add_new_deal.dart';
import 'package:flutter/material.dart';

class ClientsScreen extends StatefulWidget {
  @override
  _ClientsScreenState createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.orangeAccent,
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddNewDeal())),
        ),
        body: ShowClientData());
  }
}
