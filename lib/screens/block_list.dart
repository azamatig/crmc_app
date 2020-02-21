import 'dart:convert';
import 'dart:async';
import 'package:crmc_app/models/apartments_model.dart';
import 'package:crmc_app/screens/add_new_contract.dart';
import 'package:crmc_app/utilities/vars.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:search_page/search_page.dart';
import '../services/auth.dart';

class ComplexList extends StatefulWidget {
  @override
  _ComplexListState createState() => _ComplexListState();
}

class _ComplexListState extends State<ComplexList>
    with AutomaticKeepAliveClientMixin<ComplexList> {
  Future<List<ApartmentsList>> _future1;
//Keeps list in alive instead of rebuilding it every time
  @override
  bool get wantKeepAlive => true;

  //List fetcher
  Future<List<ApartmentsList>> _fetchContacts() async {
    Auth provider;
    provider = Auth();
    final client = await provider.client;
    final url = restApiUrl +
        'v2/entities/crmc\$Apartment?view=getApartmentList.view&returnNulls=false';
    var response = await client.get(url, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((apartments) => ApartmentsList.fromMap(apartments))
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
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Center(child: Text('Поиск квартиры')),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<ApartmentsList>(
                    searchLabel: 'Поиск квартир',
                    suggestion: Center(
                      child: Text('Поиск квартир по коду кв., или названию ЖК'),
                    ),
                    failure: Center(
                      child: Text('Ничего не найдено 😐'),
                    ),
                    builder: (data) => ListTile(
                        title: Text('Квартира: ' +
                            data.code +
                            "/" +
                            data.complexBlockSection.complexBlock.name),
                        subtitle: Text('Комплекс: ' +
                            data.complexBlockSection.complexBlock.complex.name),
                        trailing: IconButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AddNewDeal(data.id))),
                          icon: Icon(Icons.arrow_forward_ios),
                          color: Colors.black45,
                        )),
                    filter: (value) => [
                          value.code,
                          value.complexBlockSection.complexBlock.complex.name,
                        ],
                    items: data)),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              child: _tile(
                  data[index].code,
                  data[index].complexBlockSection.complexBlock.complex.name,
                  data[index].complexBlockSection.complexBlock.name,
                  Icons.work,
                  context),
            );
          }),
    );
  }

  @override
  void initState() {
    setState(() {
      _future1 = _fetchContacts();
    });
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return FutureBuilder<List<ApartmentsList>>(
      future: _future1,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ApartmentsList> data = snapshot.data;
          return _contactListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            color: Colors.deepPurple,
            child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

//ListTile after successful fetching data
Card _tile(String code, String complexName, String skidMark, IconData icon,
        context) =>
    Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 50.0,
                height: 150.0,
                color: Colors.deepPurple,
                child: Icon(
                  FontAwesomeIcons.city,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Комплекс',
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Квартира:',
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
                              code != null ? code : '-',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Пятно:',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        skidMark != null ? skidMark : '-',
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Название комплекса:',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        complexName != null ? complexName : '-',
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
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.plus),
                color: Colors.orangeAccent,
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
