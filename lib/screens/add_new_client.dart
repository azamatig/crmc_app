/*
анон: Почему говорят, что Штирлиц был на грани провала?
Ведь у провала сидел Бендер.
 */
import 'package:crmc_app/services/createNewContactRest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddNewContact extends StatefulWidget {
  AddNewContact();
  @override
  _AddNewContactState createState() => _AddNewContactState();
}

class _AddNewContactState extends State<AddNewContact> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _middleNameController = TextEditingController();
  TextEditingController _iinController = TextEditingController();

  _AddNewContactState();

  @override
  void initState() {
    super.initState();
  }

  createContact() async {
    String upperName = _firstNameController.text;
    String nationalIdentifier = _iinController.text;
    var res =
        await NewContactRest().sendNewRequest(upperName, nationalIdentifier);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    //Creates Contact
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Новый клиент',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      cursorColor: Colors.deepPurple,
                      controller: _firstNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.text_fields,
                          size: 30.0,
                        ),
                        labelText: 'Имя',
                      ),
                      /*                  validator: (input) {
                        if (input.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },*/
                    ),
                    TextFormField(
                      cursorColor: Colors.deepPurple,
                      controller: _middleNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.text_fields,
                          size: 30.0,
                        ),
                        labelText: 'Отчество',
                      ),
                      /*     validator: (input) {
                        if (input.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },*/
                    ),
                    TextFormField(
                      cursorColor: Colors.deepPurple,
                      controller: _lastNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.text_fields,
                          size: 30.0,
                        ),
                        labelText: 'Фамилия',
                      ),
                      /*       validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },*/
                    ),
                    TextFormField(
                      cursorColor: Colors.deepPurple,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      controller: _iinController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.card_membership,
                          size: 30.0,
                        ),
                        labelText: 'ИИН(только цифры)',
                      ),
                      /*              validator: (input) {
                        if (input.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },*/
                    ),
                    TextFormField(
                      cursorColor: Colors.deepPurple,
                      controller: _lastNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.place,
                          size: 30.0,
                        ),
                        labelText: 'Место Рождения',
                      ),
                      /*             validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },*/
                    ),
                    TextFormField(
                      cursorColor: Colors.deepPurple,
                      controller: _lastNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone_android,
                          size: 30.0,
                        ),
                        labelText: 'Мобильный телефон',
                      ),
                      /*          validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },*/
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BasicDateField(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.person_pin,
                          size: 30,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          'Пол',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          width: 45,
                        ),
                        DropdownButton<Sex>(
                          itemHeight: 60,
                          hint: Text("Пол"),
                          value: selectedUser,
                          onChanged: (Sex value) {
                            setState(() {
                              selectedUser = value;
                            });
                          },
                          items: sex.map((Sex user) {
                            return DropdownMenuItem<Sex>(
                              value: user,
                              child: Row(
                                children: <Widget>[
                                  user.icon,
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    user.name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                      child: Text(
                        'Менеджер (Ответственный)',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownButton<Managers>(
                      itemHeight: 75,
                      hint: Text("Менеджер"),
                      value: selectedManager,
                      onChanged: (Managers shmalue) {
                        setState(() {
                          selectedManager = shmalue;
                        });
                      },
                      items: managers.map((Managers manager) {
                        return DropdownMenuItem<Managers>(
                          value: manager,
                          child: Row(
                            children: <Widget>[
                              manager.icon,
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                manager.name,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    Container(
                      margin: EdgeInsets.all(40.0),
                      height: 50.0,
                      width: 250.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: FlatButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, do an Update, есь же.
                              createContact();
                              Navigator.pop(context); //fun1
                              print('Success');
                            }
                          },
                          textColor: Colors.white,
                          child: Text(
                            'Сохранить',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        'Дата Рождения (${format.pattern})',
        style: TextStyle(color: Colors.black45),
      ),
      DateTimeField(
        initialValue: DateTime.now(),
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}

class Sex {
  const Sex(this.name, this.icon);
  final String name;
  final Icon icon;
}

Sex selectedUser;
List<Sex> sex = <Sex>[
  const Sex(
      'Мужской',
      Icon(
        FontAwesomeIcons.mars,
        color: Colors.deepPurple,
      )),
  const Sex(
      'Женский',
      Icon(
        FontAwesomeIcons.venus,
        color: Colors.deepPurple,
      )),
];

class Managers {
  const Managers(this.name, this.icon);
  final String name;
  final Icon icon;
}

Managers selectedManager;
List<Managers> managers = <Managers>[
  const Managers(
      'Алена Бедарева',
      Icon(
        FontAwesomeIcons.female,
        color: Colors.deepPurple,
      )),
  const Managers(
      'Пак Елена',
      Icon(
        FontAwesomeIcons.female,
        color: Colors.deepPurple,
      )),
  const Managers(
      'Азамат Мухамеджанов',
      Icon(
        FontAwesomeIcons.male,
        color: Colors.deepPurple,
      )),
  const Managers(
      'Сауле Садыкова',
      Icon(
        FontAwesomeIcons.female,
        color: Colors.deepPurple,
      )),
  const Managers(
      'Асель Авкешова',
      Icon(
        FontAwesomeIcons.female,
        color: Colors.deepPurple,
      )),
];
