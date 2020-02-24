import 'dart:convert';
import 'dart:async';
import 'package:crmc_app/models/contracts_model.dart';
import 'package:crmc_app/screens/add_new_contract.dart';
import 'package:crmc_app/screens/contract_details.dart';
import 'package:crmc_app/utilities/vars.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:search_page/search_page.dart';
import '../services/auth.dart';

class ShowContractData extends StatefulWidget {
  @override
  _ShowContractDataState createState() => _ShowContractDataState();
}

var formatter = new DateFormat('yyyy-MM-dd');
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
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 237.0, 0.0),
        child: Center(child: Text('CRMC')),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.person_add,
            color: Colors.white,
          ),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => AddNewDeal(null, null))),
        ),
        IconButton(
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                                data.currency.languageValue),
                          ),
                        ),
                        icon: Icon(Icons.arrow_forward_ios),
                        color: Colors.black45,
                      )),
                  filter: (party) => [
                        party.number,
                        party.party.name,
                        party.responsible.fullName,
                      ],
                  items: data)),
          icon: Icon(Icons.search),
        ),
      ],
    ),
    body: ListView.builder(
        itemExtent: 239,
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

  Future<List<Contracts>> _contractFuture;

  @override
  void initState() {
    //cache Future
    _contractFuture = _fetchContracts();
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contracts>>(
      future: _contractFuture,
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

Card _tileContract(
        String number,
        String amount,
        String shortName,
        String code,
        String name,
        String languageValue,
        DateTime startDate,
        IconData icon,
        context) =>
    Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(width: 10.0, height: 230.0, color: Colors.deepPurple),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
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
                        number + " / " + formatter.format(startDate),
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 14.0,
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
                            fontSize: 14.0,
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
                            fontSize: 14.0,
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
                            fontSize: 14.0,
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
                            fontSize: 14.0,
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
                icon: Icon(FontAwesomeIcons.angleRight),
                color: Colors.black45,
              )
            ],
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
