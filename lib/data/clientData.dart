import 'dart:convert';
import 'dart:async';
import 'package:crmc_app/models/contactModels.dart';
import 'package:crmc_app/screens/contactDetails.dart';
import 'package:crmc_app/utilities/vars.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';

class ShowClientData extends StatefulWidget {
  @override
  _ShowClientDataState createState() => _ShowClientDataState();
}

//List fetcher
Future<List<Contacts>> _fetchContacts() async {
  Auth provider;
  provider = Auth();
  final client = await provider.client;
  final url = restApiUrl +
      'v2/entities/crm\$Party?returnNulls=false&dynamicAttributes=false&view=party.edit&limit=10';
  var response = await client.get(url, headers: {
    'Content-Type': 'application/json',
  });
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((contacts) => Contacts.fromJson(contacts)).toList();
  } else {
    throw Exception('Failed to load Clients from REST API');
  }
}

//ListView of things
ListView _contactListView(data) {
  return ListView.builder(
      itemExtent: 227.0,
      itemCount: 5,
      itemBuilder: (context, index) {
        return _tile(
            data[index].upperName,
            data[index].partyType,
            data[index].nationalIdentifier,
            data[index].clientStatus.languageValue,
            data[index].responsible.fullName,
            data[index].contactInfo[0].value,
            Icons.work,
            context);
      });
}

class _ShowClientDataState extends State<ShowClientData>
    with AutomaticKeepAliveClientMixin<ShowClientData> {
  Future<List<Contacts>> _future;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    setState(() {
      _future = _fetchContacts();
    });
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contacts>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Contacts> data = snapshot.data;
          return _contactListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

//ListTile when fetching data
Column _tile(
        String upperName,
        String partyType,
        String nationalIdentifier,
        String languageValue,
        String fullName,
        String value,
        IconData icon,
        context) =>
    Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(width: 10.0, height: 225.0, color: Colors.deepPurple),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Клиент',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'ФИО:',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.5),
                      child: Row(
                        children: <Widget>[
                          Text(
                            upperName != null ? upperName : '-',
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Статус клиента:',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      languageValue != null ? languageValue : '-',
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'ИИН:',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: Text(
                        nationalIdentifier != null
                            ? nationalIdentifier
                            : 'ИИН: Не указано',
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Моб.телефон',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      value != null ? value : '-',
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Менеджер',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      fullName != null ? fullName : '-',
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
                      builder: (_) => DetailsScreen(upperName, partyType,
                          nationalIdentifier, languageValue, fullName, value))),
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
