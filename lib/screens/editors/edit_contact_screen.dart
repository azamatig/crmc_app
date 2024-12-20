import 'package:crmc_app/models/party_model.dart';
import 'package:crmc_app/services/edit_contact_rest.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class EditContactScreen extends StatefulWidget {
  EditContactScreen(this.id);
  final format = DateFormat("yyyy-MM-dd");
  final String id;

  @override
  _EditContactScreenState createState() => _EditContactScreenState(this.id);
}

class _EditContactScreenState extends State<EditContactScreen> {
  final String id;
  _EditContactScreenState(this.id);
  PartyEntity partyEntity;

  final _formKey = GlobalKey<FormState>();
  // TextEditingController _nameController = TextEditingController();
  TextEditingController _nationalIdentifierController = TextEditingController();
  // TextEditingController _clientController = TextEditingController();
  // TextEditingController _responsibleController = TextEditingController();
  // TextEditingController _idController = TextEditingController();
  // bool _residentController;

  @override
  void initState() {
    super.initState();
  }

  //Creates Contact info
  updateContact() async {
    // party.name = _nameController.text;
    String nationalIdentifier = _nationalIdentifierController.text;
    // party.resident = _residentController;
    // party.clientStatus.languageValue = _clientController.text;
    // party.responsible.fullName = _responsibleController.text;
    var res = await EditContactRest(id).editContact(nationalIdentifier);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Редактирование клиента',
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
                    /*      TextFormField(
                      cursorColor: Colors.deepPurple,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.text_fields,
                          size: 30.0,
                        ),
                        labelText: 'ФИО Клиента',
                      ),
                        validator: (input) {
                        if (input.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },
                    ),*/
                    /*     TextFormField(
                      cursorColor: Colors.deepPurple,
                      // controller: _nameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.text_fields,
                          size: 30.0,
                        ),
                        labelText: 'Отчество',
                      ),
                      /*    validator: (input) {
                        if (input.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },*/
                    ),*/
                    /*    TextFormField(
                      cursorColor: Colors.deepPurple,
                      controller: _clientController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.text_fields,
                          size: 30.0,
                        ),
                        labelText: 'Фамилия',
                      ),
                      /*     validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },*/
                    ),*/
                    TextFormField(
                      controller: _nationalIdentifierController,
                      cursorColor: Colors.deepPurple,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      //  controller: _iinController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.card_membership,
                          size: 30.0,
                        ),
                        labelText: 'ИИН(только цифры)',
                      ),
                      /*    validator: (input) {
                        if (input.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },*/
                    ),
                    /*      TextFormField(
                      cursorColor: Colors.deepPurple,
                      controller: _clientController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.place,
                          size: 30.0,
                        ),
                        labelText: 'Место Рождения',
                      ),
                      /*      validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },*/
                    ),*/
                    /*       TextFormField(
                      cursorColor: Colors.deepPurple,
                      controller: _responsibleController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person_pin,
                          size: 30.0,
                        ),
                        labelText: 'Ваш пол',
                      ),
                      /*  validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },*/
                    ),*/
                    /*   TextFormField(
                      cursorColor: Colors.deepPurple,
                      //  controller: _lastNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone_android,
                          size: 30.0,
                        ),
                        labelText: 'Мобильный телефон',
                      ),
                      /*     validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },*/
                    ),*/
                    /*  Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 25.0, 0.0, 0.0),
                      child: BasicDateField(),
                    ),*/
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
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, do an Update, есь же.
                              updateContact(); //fun1
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
