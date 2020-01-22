import 'dart:convert';
import 'dart:async';
import 'package:crmc_app/models/ContractsModel.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';

class ShowContractData extends StatefulWidget {
  @override
  _ShowContractDataState createState() => _ShowContractDataState();
}

Future<List<Deals>> _fetchContracts() async {
  Auth provider;
  provider = Auth();
  final client = await provider.client;
  final url = 'http://192.168.88.101:8078/crmc/rest/v2/entities/crmc\$Contract';
  var response = await client.get(url, headers: {
    'Content-Type': 'application/json',
  });
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((deals) => new Deals.fromJson(deals)).toList();
  } else {
    throw Exception('Failed to load Contracts from REST API');
  }
}

ListView _contractListView(data) {
  return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0.0),
      scrollDirection: Axis.vertical,
      primary: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tileContract(data[index].number, data[index].apartmentCode,
            data[index].instanceName, data[index].name, Icons.work);
      });
}

class _ShowContractDataState extends State<ShowContractData> {
  Future<List<Deals>> _future;
  @override
  void initState() {
    _future = _fetchContracts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Deals>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Deals> data = snapshot.data;
          return _contractListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

Column _tileContract(String number, String apartmentCode, String instanceName,
        String name, IconData icon) =>
    Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(width: 10.0, height: 150.0, color: Colors.deepPurple),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        instanceName,
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      apartmentCode,
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
              onPressed: () => (null),
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
