import 'dart:io';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

String langValue;
String restApiUrl = "http://192.168.88.101:8078/crmc/rest/";
String clientEntity = "192.168.88.101:8078/crmc/rest/v2/entities/crmc\$Contact";
String contractEntity =
    "192.168.88.101:8078/crmc/rest/v2/entities/crmc\$Contract";
String aToken;
String userId;

String connectionTimeCode = "CONNECTION_TIME_OUT";
String accessError = "ACCESS_ERROR";

Widget errorAlertDialog(var context, String title, String content) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.circular(12.0)),
    titleTextStyle: Theme.of(context).textTheme.title,
    contentTextStyle: Theme.of(context).textTheme.subhead,
    actions: <Widget>[
      ButtonTheme(
        minWidth: 50.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Theme.of(context).accentColor)),
        child: MaterialButton(
          color: Theme.of(context).accentColor,
          disabledColor: Color(0xB1B0AF),
          disabledElevation: 1,
          disabledTextColor: Colors.black,
          child: Text(
            'close',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      )
    ],
  );
}

Widget waitingScreen(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(color: Colors.deepPurple),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: CircularProgressIndicator(
        semanticsLabel: "Ожидание",
        backgroundColor: Colors.white,
      )),
    ),
  );
}

// ignore: missing_return
Future<bool> checkConnection() async {
  try {
    final result = await InternetAddress.lookup('192.168.88.101:8078/crmc');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}

class Card1 extends StatelessWidget {
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                tapHeaderToExpand: true,
                tapBodyToCollapse: true,
                theme: ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Тип договора",
                      style: Theme.of(context).textTheme.body2,
                    )),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var _ in Iterable.generate(1))
                      TextFormField(
                        controller: _lastNameController,
                        style: TextStyle(fontSize: 18.0),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.text_fields,
                            size: 30.0,
                          ),
                          labelText: 'item 1',
                        ),
                      ),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
