import 'package:crmc_app/models/contact_model.dart';
import 'package:crmc_app/screens/editors/edit_contact_screen.dart';
import 'package:crmc_app/services/auth.dart';
import 'package:crmc_app/utilities/vars.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(this.id);
  final String id;

  @override
  _DetailsScreenState createState() => _DetailsScreenState(this.id);
}

class _DetailsScreenState extends State<DetailsScreen> {
  final String id;
  _DetailsScreenState(this.id);

  Future<Contacts> _fetchContacts() async {
    Auth provider;
    provider = Auth();
    final client = await provider.client;
    var myId = widget.id;
    final url = restApiUrl +
        'v2/entities/crm\$Party/$myId?view=party.edit&returnNulls=false&limit=1';
    var response = await client.get(url, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      final contacts = contactsFromJson(response.body);
      return contacts;
    } else {
      throw Exception('Failed to load Client from REST API');
    }
  }

  Widget build(BuildContext context) {
    return FutureBuilder<Contacts>(
      future: _fetchContacts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Contacts data = snapshot.data;
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,
                title: Text('Информация по клиенту'),
              ),
              body: _contactListView(data));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Scaffold(
            backgroundColor: Colors.deepPurple,
            body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  Container _contactListView(data) {
    return Container(
        child: _details(
            data.upperName,
            data.contactIdentityDocuments[0].contact.dateOfBirth,
            data.contactIdentityDocuments[0].contact.nationalIdentifier,
            data.contactInfo[0].value,
            data.addresses[0].fullAddress,
            data.responsible.fullName,
            data.clientStatus.langValue,
            data.contactIdentityDocuments[0].contact.sex.langValue1,
            data.contactIdentityDocuments[0].contact.resident,
            data.responsible.mobilePhone,
            data.residenceCountry.languageValue,
            context));
  }

  Widget _details(
      String upperName,
      DateTime dateOfBirth,
      String nationalIdentifier,
      String value,
      String fullAddress,
      String fullName,
      String langValue,
      String langValue1,
      bool resident,
      String mobilePhone,
      String languageValue,
      context) {
    var now = dateOfBirth;
    var formatter = new DateFormat('yyyy-MM-dd');
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Контакты',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                            ),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EditContactScreen(id))),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.library_books,
                            size: 14,
                            color: Colors.blueGrey[300],
                          ),
                          SizedBox(width: 3),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ФИО Клиента:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.blueGrey[300],
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          upperName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Мобильный телефон:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.blueGrey[300],
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 17),
                      Divider(
                        height: 2,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(height: 17),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Общая информация",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'ФИО Клиента:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.blueGrey[300],
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          upperName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Статус клиента:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.blueGrey[300],
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          langValue,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'ИИН:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.blueGrey[300],
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          nationalIdentifier,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Дата Рождения',
                          style: TextStyle(
                            color: Colors.blueGrey[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                          // Вторая часть листа
                          children: <Widget>[
                            SizedBox(height: 20),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                formatter.format(now).toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ]),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Страна',
                          style: TextStyle(
                            color: Colors.blueGrey[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                          // Вторая часть листа
                          children: <Widget>[
                            SizedBox(height: 20),
                            Container(
                              child: Expanded(
                                child: Text(
                                  languageValue,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Адрес проживания',
                          style: TextStyle(
                            color: Colors.blueGrey[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                          // Вторая часть листа
                          children: <Widget>[
                            SizedBox(height: 20),
                            Container(
                              child: Expanded(
                                child: Text(
                                  fullAddress,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Пол',
                          style: TextStyle(
                            color: Colors.blueGrey[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                          // Вторая часть листа
                          children: <Widget>[
                            SizedBox(height: 20),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                langValue1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ]),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Резидентство',
                          style: TextStyle(
                            color: Colors.blueGrey[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                          // Вторая часть листа
                          children: <Widget>[
                            SizedBox(height: 20),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                resident == true ? 'Резидент' : 'Не резидент',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Менеджер',
                          style: TextStyle(
                            color: Colors.blueGrey[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                          // Вторая часть листа
                          children: <Widget>[
                            SizedBox(height: 20),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                fullName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ]),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          mobilePhone,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
