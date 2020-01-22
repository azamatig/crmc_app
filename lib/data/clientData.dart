import 'dart:convert';
import 'dart:async';
import 'package:crmc_app/models/contactModels.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';

class ShowClientData extends StatefulWidget {
  @override
  _ShowClientDataState createState() => _ShowClientDataState();
}

Future<List<Contacts>> _fetchContacts() async {
  Auth provider;
  provider = Auth();
  final client = await provider.client;
  final url = 'http://192.168.88.101:8078/crmc/rest/v2/entities/crmc\$Contact';
  var response = await client.get(url, headers: {
    'Content-Type': 'application/json',
  });
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((contacts) => new Contacts.fromJson(contacts))
        .toList();
  } else {
    throw Exception('Failed to load Clients from REST API');
  }
}

ListView _contactListView(data) {
  return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0.0),
      scrollDirection: Axis.vertical,
      primary: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tile(data[index].firstName, data[index].lastName,
            data[index].instanceName, data[index].legacyId, Icons.work);
      });
}

class _ShowClientDataState extends State<ShowClientData> {
  Future<List<Contacts>> _future;
  @override
  void initState() {
    _future = _fetchContacts();
    super.initState();
  }

  @override
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

Column _tile(String firstName, String lastName, String instanceName,
        String legacyId, IconData icon) =>
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
                      firstName + " " + lastName,
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
                      legacyId,
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
