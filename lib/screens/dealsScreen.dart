/*
xxx: Я как-то видел мужика, который себе в бане соорудил купе поезда.
С полками, столиком - всё как положено. Вместо окна - большой телевизор
@bash.im
*/
import 'package:crmc_app/data/ContractData.dart';
import 'package:crmc_app/screens/add_new_deal.dart';
import 'package:flutter/material.dart';

class Contracts extends StatefulWidget {
  @override
  _ContractsState createState() => _ContractsState();
}

class _ContractsState extends State<Contracts> {
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
        body: ShowContractData());
  }
}
