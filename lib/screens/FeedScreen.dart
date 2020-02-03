/*
xxx: Я как-то видел мужика, который себе в бане соорудил купе поезда.
С полками, столиком - всё как положено. Вместо окна - большой телевизор
@bash.im
*/
import 'package:crmc_app/data/clientData.dart';
import 'package:crmc_app/screens/add_new_client.dart';
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
          heroTag: 'tag1',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddNewContact(null))),
        ),
        body: ShowClientData());
  }
}
