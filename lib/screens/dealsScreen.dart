/*
xxx: Я как-то видел мужика, который себе в бане соорудил купе поезда.
С полками, столиком - всё как положено. Вместо окна - большой телевизор
@bash.im
*/
import 'package:crmc_app/screens/add_new_deal.dart';
import 'package:flutter/material.dart';

class Contracts extends StatefulWidget {
  Contracts({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ContractsState createState() => _ContractsState();
}

class _ContractsState extends State<Contracts> {
  TextEditingController _searchController = TextEditingController();
  String _users;

  _clearSearch() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _searchController.clear());
    setState(() {
      _users = null;
    });
  }

  var data = [
    {
      "title": "Contract № and headline",
      "content": "01.01.2020 Description of Contract here(Date and Sum)",
      "color": 'Manager or Client name here',
      "image": "https://picsum.photos/200?random"
    },
    {
      "title": "Contract № and headline",
      "content": "01.01.2020 Description of Contract here(Date and Sum)",
      "color": 'Manager or Client name here',
      "image": "https://picsum.photos/100?random"
    },
    {
      "title": "Contract № and headline",
      "content": "01.01.2020 This is just a text description of the item",
      "color": 'Manager or Client name here',
      "image": "https://picsum.photos/150?random"
    },
    {
      "title": "Contract № and headline",
      "content": "01.01.2020 Description of Contract here(Date and Sum)",
      "color": 'Manager or Client name here',
      "image": "https://picsum.photos/125?random"
    },
    {
      "title": "Hey Flutterers, See what I did with Flutter",
      "content": "01.01.2020 Description of Contract here(Date and Sum)",
      "color": 'Manager or Client name here',
      "image": "https://picsum.photos/175?random"
    },
    {
      "title": "Contract № and headline",
      "content": "01.01.2020 Description of Contract here(Date and Sum)",
      "color": 'Manager or Client name here',
      "image": "https://picsum.photos/225?random"
    },
    {
      "title": "Hey Flutterers, See what I did with Flutter",
      "content": "01.01.2020 Description of Contract here(Date and Sum)",
      "color": 'Manager or Client name here',
      "image": "https://picsum.photos/250?random"
    },
    {
      "title": "Contract № and headline",
      "content": "01.01.2020 Description of Contract here(Date and Sum)",
      "color": 'Manager or Client name here',
      "image": "https://picsum.photos/350?random"
    },
    {
      "title": "Contract № and headline",
      "content": "01.01.2020 This is just a text description of the item",
      "color": 'Manager or Client name here',
      "image": "https://picsum.photos/275?random"
    },
    {
      "title": "Contract № and headline",
      "content": "01.01.2020 Description of Contract here(Date and Sum)",
      "color": 'Manager or Client name here',
      "image": "https://picsum.photos/300?random"
    },
    {
      "title": "Contract № and headline",
      "content": "01.01.2020 Description of Contract here(Date and Sum)",
      "color": 'Manager or Client name here',
      "image": "https://picsum.photos/325?random"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            hintText: 'Поиск',
            prefixIcon: Icon(
              Icons.search,
              size: 30.0,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
              ),
              onPressed: _clearSearch,
            ),
            filled: true,
          ),
          onSubmitted: (input) {
            if (input.isNotEmpty) {
              setState(() {
                //      _users = DBProvider.searchUsers(input);
              });
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.orangeAccent,
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddNewDeal())),
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

//Random comment here, yup *,..,* (rheeeee meme here)
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
    return Column(
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.color,
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Divider(
          height: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
