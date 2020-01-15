import 'package:crmc_app/screens/add_new_client.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = [
    {
      "title": "Имя Фамилия Клиента",
      "content": "01/01/2020",
      "color": "Status of client",
      "image": "https://picsum.photos/200?random"
    },
    {
      "title": "Имя Фамилия Клиента",
      "content": "01/01/2020",
      "color": "Status of client",
      "image": "https://picsum.photos/100?random"
    },
    {
      "title": "Имя Фамилия Клиента",
      "content": "01/01/2020",
      "color": "Status of client",
      "image": "https://picsum.photos/150?random"
    },
    {
      "title": "Имя Фамилия Клиента",
      "content": "01/01/2020",
      "color": "Status of client",
      "image": "https://picsum.photos/125?random"
    },
    {
      "title": "Имя Фамилия Клиента",
      "content": "01/01/2020",
      "color": "Status of client",
      "image": "https://picsum.photos/175?random"
    },
    {
      "title": "Имя Фамилия Клиента",
      "content": "01/01/2020",
      "color": "Status of client",
      "image": "https://picsum.photos/225?random"
    },
    {
      "title": "Имя Фамилия Клиента",
      "content": "01/01/2020",
      "color": "Status of client",
      "image": "https://picsum.photos/250?random"
    },
    {
      "title": "Имя Фамилия Клиента",
      "content": "01/01/2020",
      "color": "Status of client",
      "image": "https://picsum.photos/350?random"
    },
    {
      "title": "Имя Фамилия Клиента",
      "content": "01/01/2020",
      "color": "Status of client",
      "image": "https://picsum.photos/275?random"
    },
    {
      "title": "Имя Фамилия Клиента",
      "content": "01/01/2020 ",
      "color": "Имя Фамилия Клиента",
      "image": "https://picsum.photos/300?random"
    },
    {
      "title": "Имя Фамилия Клиента",
      "content": "01/01/2020",
      "color": "Status of client",
      "image": "https://picsum.photos/325?random"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddNewContact())),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0.0),
        scrollDirection: Axis.vertical,
        primary: true,
        itemCount: data.length,
        itemBuilder: (BuildContext content, int index) {
          return AwesomeListItem(
              title: data[index]["title"],
              content: data[index]["content"],
              color: data[index]["color"],
              image: data[index]["image"]);
        },
      ),
    );
  }
}

class AwesomeListItem extends StatefulWidget {
  final String title;
  final String content;
  final String color;
  final String image;

  AwesomeListItem({this.title, this.content, this.color, this.image});

  @override
  _AwesomeListItemState createState() => new _AwesomeListItemState();
}

class _AwesomeListItemState extends State<AwesomeListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(width: 10.0, height: 190.0, color: Colors.deepPurple),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    widget.content,
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    widget.color,
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
