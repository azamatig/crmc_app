import 'dart:convert';
import 'dart:async';
import 'package:crmc_app/models/ContractsModel.dart';
import 'package:crmc_app/screens/contractDetails.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';

class ShowContractData extends StatefulWidget {
  @override
  _ShowContractDataState createState() => _ShowContractDataState();
}

Future<List<Contracts>> _fetchContracts() async {
  Auth provider;
  provider = Auth();
  final client = await provider.client;
  final url =
      'http://192.168.88.100:8078/crmc/rest/v2/entities/crmc\$Contract?returnNulls=false&dynamicAttributes=true&view=contract.edit&limit=30';
  var response = await client.get(url, headers: {
    'Content-Type': 'application/json',
  });
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((contracts) => new Contracts.fromJson(contracts))
        .toList();
  } else {
    throw Exception('Failed to load Contracts from REST API');
  }
}

ListView _contractListView(data) {
  return ListView.builder(
      itemExtent: 232,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tileContract(
            data[index].mainContract,
            data[index].amountAndCurrency,
            data[index].party.responsible.shortName,
            data[index].type.code,
            data[index].party.name,
            Icons.work,
            context);
      });
}

class _ShowContractDataState extends State<ShowContractData>
    with AutomaticKeepAliveClientMixin<ShowContractData> {
  @override
  bool get wantKeepAlive => true;

  Future<List<Contracts>> _future;
  @override
  void initState() {
    _future = _fetchContracts();
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contracts>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Contracts> data = snapshot.data;
          return _contractListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

Column _tileContract(String mainContract, String amountAndCurrency,
        String shortName, String code, String name, IconData icon, context) =>
    Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(width: 10.0, height: 230.0, color: Colors.deepPurple),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Договор',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Номер контракта',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      mainContract,
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Тип контракта',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      code,
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Сумма контракта',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      amountAndCurrency,
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'ФИО Клиента',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'Менеджер',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      shortName,
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ContractDetailsScreen(mainContract,
                          amountAndCurrency, shortName, code, name))),
              icon: Icon(Icons.arrow_forward_ios),
              color: Colors.black45,
            )
          ],
        ),
        Divider(
          height: 1,
          color: Colors.black,
        ),
      ],
    );
