/*
xxx: Я как-то видел мужика, который себе в бане соорудил купе поезда.
С полками, столиком - всё как положено. Вместо окна - большой телевизор
@bash.im
*/
import 'package:crmc_app/data/clientData.dart';
import 'package:crmc_app/screens/add_new_client.dart';
import 'package:flutter/material.dart';

class ClientFeedScreen extends StatefulWidget {
  @override
  _ClientFeedScreenState createState() => _ClientFeedScreenState();
}

class _ClientFeedScreenState extends State<ClientFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddNewContact())),
        ),
        body: ShowClientData());
  }
}
