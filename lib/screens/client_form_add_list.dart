import 'dart:convert';
import 'dart:async';
import 'package:crmc_app/models/party_model.dart';
import 'package:crmc_app/screens/add_new_contract.dart';
import 'package:crmc_app/screens/contact_details.dart';
import 'package:crmc_app/utilities/vars.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:search_page/search_page.dart';
import '../services/auth.dart';

class ClientFormData extends StatefulWidget {
  @override
  _ClientFormDataState createState() => _ClientFormDataState();
}

class _ClientFormDataState extends State<ClientFormData>
    with AutomaticKeepAliveClientMixin<ClientFormData> {
  Future<List<PartyEntity>> _future;
//Keeps list in alive instead of rebuilding it every time
  @override
  bool get wantKeepAlive => true;

  //List fetcher
  Future<List<PartyEntity>> _fetchContacts() async {
    Auth provider;
    provider = Auth();
    final client = await provider.client;
    final url =
        restApiUrl + 'v2/entities/crm\$Party?view=party.browse&limit=50';
    var response = await client.get(url, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((partyEntity) => PartyEntity.fromMap(partyEntity))
          .toList();
    } else {
      throw Exception('Failed to load Clients from REST API');
    }
  }

//ListView of Clients and Search Page as well
  Scaffold _contactListView(data) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 150.0, 0.0),
          child: Center(child: Text('Добавить клиента')),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<PartyEntity>(
                    searchLabel: 'Поиск клиентов',
                    suggestion: Center(
                      child: Text('Поиск клиентов по ФИО, ИИН'),
                    ),
                    failure: Center(
                      child: Text('Ничего не найдено 😐'),
                    ),
                    builder: (data) => ListTile(
                        title: Text('ФИО: ' + data.name),
                        subtitle: Text('ИИН: ' + data.nationalIdentifier),
                        trailing: IconButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailsScreen(data.id))),
                          icon: Icon(Icons.arrow_forward_ios),
                          color: Colors.black45,
                        )),
                    filter: (party) => [
                          party.name,
                          party.nationalIdentifier,
                          party.responsible.shortName,
                        ],
                    items: data)),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _tile(data[index].name, data[index].nationalIdentifier,
                data[index].id, Icons.work, context);
          }),
    );
  }

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
    return FutureBuilder<List<PartyEntity>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PartyEntity> data = snapshot.data;
          return _contactListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

//ListTile after successful fetching data
Card _tile(String name, String nationalIdentifier, String clientId,
        IconData icon, context) =>
    Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 50.0,
                height: 100.0,
                color: Colors.deepPurple,
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.male,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0),
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
                              name != null ? name : '-',
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
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AddNewDeal(null, clientId))),
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
