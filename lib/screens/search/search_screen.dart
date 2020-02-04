import 'package:crmc_app/models/PartyModel.dart';
import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  Example1();

  final String title = "Filtering List";
  final String exampleUrl =
      "https://github.com/Ephenodrom/FlutterAdvancedExamples/tree/master/lib/examples/filterList";

  @override
  _Example1State createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  List<PartyEntity> initialList = [];
  List<PartyEntity> currentList = [];

  //filter
  bool residentEvil = false;
  String carType = "all";

  final controller = new TextEditingController();

  @override
  initState() {
    super.initState();
    controller.addListener(onChange);
    filterCars();
  }

  @override
  Widget build(BuildContext context) {
    filterCars();
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(children: [
        Text(
          "фильтры",
          style: Theme.of(context).textTheme.headline,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(controller: controller),
        ),
        SwitchListTile(
            title: Text('Резидент'),
            value: residentEvil,
            onChanged: (changed) {
              setState(() => residentEvil = changed);
            }),
        ListTile(
            leading: Text("Тип юзера(Placeholder)"),
            trailing: DropdownButton(
              elevation: 16,
              onChanged: (item) {
                setState(() {
                  carType = item;
                });
              },
              hint: Text(carType),
              items: [
                DropdownMenuItem<String>(child: new Text("All"), value: "All"),
                DropdownMenuItem<String>(child: new Text("Gas"), value: "Gas"),
                DropdownMenuItem<String>(
                    child: new Text("Diesel"), value: "Diesel"),
                DropdownMenuItem<String>(
                    child: new Text("Electric"), value: "Electric")
              ],
            )),
        Expanded(
          child: ListView.builder(
              itemCount: currentList.length,
              itemBuilder: (BuildContext context, int index) {
                PartyEntity current = currentList.elementAt(index);
                return Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(current.name),
                    subtitle: Text(current.clientStatus.languageValue),
                    trailing: Text(current.nationalIdentifier),
                    leading: Text(current.active.toString()),
                  ),
                );
              }),
        ),
      ]),
    ));
  }

  onChange() {
    setState(() {});
  }

  filterCars() {
    // Prepare lists
    List<PartyEntity> tmp = [];
    currentList.clear();

    String name = controller.text;
    if (name.isEmpty) {
      tmp.addAll(initialList);
    } else {
      for (PartyEntity c in initialList) {
        if (c.name.toLowerCase().startsWith(name.toLowerCase())) {
          tmp.add(c);
        }
      }
    }
    currentList = tmp;

    if (residentEvil) {
      tmp = [];
      for (PartyEntity c in currentList) {
        if (c.resident == residentEvil) {
          tmp.add(c);
        }
      }
      currentList = tmp;
    }

    print("filter cars for max price " + name);
    tmp = [];
    for (PartyEntity c in currentList) {
      if (c.nationalIdentifier == name) {
        tmp.add(c);
      }
    }
    currentList = tmp;
    if (carType.toLowerCase() != "all") {
      tmp = [];
      for (PartyEntity c in currentList) {
        if (c.name == carType.toLowerCase()) {
          tmp.add(c);
        }
      }
      currentList = tmp;
    }
  }
}
