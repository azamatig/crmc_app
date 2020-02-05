import 'dart:convert';
import 'dart:async';
import 'package:crmc_app/models/contractsModel.dart';
import 'package:crmc_app/screens/contractDetails.dart';
import 'package:crmc_app/utilities/vars.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import '../services/auth.dart';

class ShowContractData extends StatefulWidget {
  @override
  _ShowContractDataState createState() => _ShowContractDataState();
}

//Future will get list of contracts from contract.browse view
Future<List<Contracts>> _fetchContracts() async {
  Auth provider;
  provider = Auth();
  final client = await provider.client;
  final url =
      restApiUrl + 'v2/entities/crmc\$Contract?limit=100&view=contract.browse';
  var response = await client.get(url, headers: {
    'Content-Type': 'application/json',
  });
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((contracts) => Contracts.fromMap(contracts))
        .toList();
  } else {
    throw Exception('Failed to load Contracts from REST API');
  }
}

Scaffold _contractListView(data, context) {
  return Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: Padding(
      padding: const EdgeInsets.fromLTRB(200.0, 0.0, 0.0, 0.0),
      child: FloatingActionButton(
        heroTag: 'Tag4',
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () => showSearch(
            //Search widget for contracts, gets results from ListView
            context: context,
            delegate: SearchPage<Contracts>(
                searchLabel: 'Поиск контрактов',
                suggestion: Center(
                  child: Text('Поиск контрактов по ФИО, ИИН'),
                ),
                failure: Center(
                  child: Text('Ничего не найдено 😐'),
                ),
                builder: (data) => ListTile(
                    title: Text(
                      'Договор: ' + data.number,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('ФИО: ' + data.party.name),
                    trailing: IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ContractDetailsScreen(
                                  data.number,
                                  data.amount.toString(),
                                  data.responsible.fullName,
                                  data.type.code,
                                  data.party.name,
                                  data.currency.languageValue))),
                      icon: Icon(Icons.arrow_forward_ios),
                      color: Colors.black45,
                    )),
                filter: (party) => [
                      party.number,
                      party.party.name,
                      party.responsible.fullName,
                    ],
                items: data)),
        child: Icon(Icons.search),
      ),
    ),
    body: ListView.builder(
        itemExtent: 232,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tileContract(
              data[index].number,
              data[index].amount.toString(),
              data[index].responsible.fullName,
              data[index].type.code,
              data[index].party.name,
              data[index].currency.languageValue,
              data[index].startDate,
              Icons.work,
              context);
        }),
  );
}

class _ShowContractDataState extends State<ShowContractData>
    with AutomaticKeepAliveClientMixin<ShowContractData> {
  @override
  //Keeps alive list of contracts, until user jumps into another tab
  bool get wantKeepAlive => true;

  Future<List<Contracts>> _future;
  @override
  void initState() {
    //cache Future
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
          return _contractListView(data, context);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

// _contractListView returns this _tile in body of Scaffold
// Scaffold needed for search page
Column _tileContract(
        String number,
        String amount,
        String shortName,
        String code,
        String name,
        String languageValue,
        DateTime startDate,
        IconData icon,
        context) =>
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
                      number + " / " + startDate.toString(),
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
                      amount.toString() + " " + languageValue,
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
                      builder: (_) => ContractDetailsScreen(number, amount,
                          shortName, code, name, languageValue))),
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