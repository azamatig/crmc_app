import 'package:flutter/material.dart';

class ContactDetails extends StatefulWidget {
  ContactDetails({Key key}) : super(key: key);

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Детали'),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('Какая та информация'),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () => null,
                  icon: Icon(Icons.add_circle_outline),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
