import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactDetails extends StatefulWidget {
  ContactDetails({Key key}) : super(key: key);

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

Future<bool> _goToLogin(BuildContext context) {
  return Navigator.of(context)
      .pushReplacementNamed('/')
      // we dont want to pop the screen, just replace it completely
      .then((_) => false);
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    final signOutBtn = IconButton(
      icon: const Icon(FontAwesomeIcons.signOutAlt),
      color: Colors.white,
      onPressed: () => _goToLogin(context),
    );
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
