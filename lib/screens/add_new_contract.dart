import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewDeal extends StatefulWidget {
  AddNewDeal();

  @override
  _AddNewDealState createState() => _AddNewDealState();
}

class _AddNewDealState extends State<AddNewDeal> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _iinController = TextEditingController();
  String date = 'DateTime.Now';

  @override
  void initState() {
    super.initState();
  }

  //Creates new Contract
  /* createContract(Contracts contract) async {
    contract.firstName = _firstNameController.text;
    contract.lastName = _lastNameController.text;
    contract.middleName = _middleNameController.text;
    contract.sex = _sexController;
    contract.maritalStatus = _maritalStatusController;
    contract.nationalIdentifier = _iinController.text;
    var res = await ContractRest().sendNewRequest(contract);
    return res;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Новый контракт',
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
                      controller: _firstNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.text_fields,
                          size: 30.0,
                        ),
                        labelText: '№ Недвижиости',
                      ),
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.text_fields,
                          size: 30.0,
                        ),
                        labelText: 'Сумма договора',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
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
                        labelText: 'Клиент',
                      ),
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _birthDateController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.perm_contact_calendar,
                          size: 30.0,
                        ),
                        labelText: 'Дата',
                      ),
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.place,
                          size: 30.0,
                        ),
                        labelText: 'Клиент',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person_pin,
                          size: 30.0,
                        ),
                        labelText: 'Тип покупателя',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone_android,
                          size: 30.0,
                        ),
                        labelText: 'Условия оплаты',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone_android,
                          size: 30.0,
                        ),
                        labelText: 'Подписант',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.all(40.0),
                      height: 50.0,
                      width: 250.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: FlatButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a updatus.
                              //fun1
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
