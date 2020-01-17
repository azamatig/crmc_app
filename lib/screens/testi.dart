import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

TextEditingController _lastNameController = TextEditingController();

class TestPage extends StatefulWidget {
  @override
  State createState() {
    return TestPageState();
  }
}

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableTheme(
        data: ExpandableThemeData(iconColor: Colors.blue, useInkWell: false),
        child: ListView(
          children: <Widget>[
            Card1(),
          ],
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
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
