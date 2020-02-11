import 'dart:convert';

import 'package:crmc_app/models/contractsModel.dart';
import 'package:crmc_app/models/standAloneComplexModel.dart';
import 'package:crmc_app/services/auth.dart';
import 'package:crmc_app/services/createContractRest.dart';
import 'package:crmc_app/utilities/vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool isExpanded = false;

class AddNewDeal extends StatefulWidget {
  AddNewDeal();

  @override
  _AddNewDealState createState() => _AddNewDealState();
}

class _AddNewDealState extends State<AddNewDeal> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _apartmentController = TextEditingController();
  TextEditingController _responsibleController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  var _fetchBuildings;

  @override
  void initState() {
    // _fetchBuildings = _fetchComplex();
    super.initState();
  }

  Future<List<ComplexModel>> _fetchComplex() async {
    Auth provider;
    provider = Auth();
    final client = await provider.client;
    final url =
        restApiUrl + 'v2/entities/crmc\$Complex?view=complex.edit&limit=1';
    var response = await client.get(url, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((complex) => ComplexModel.fromMap(complex))
          .toList();
    } else {
      throw Exception('Failed to load Complex from REST API');
    }
  }

  //Creates new Contract
  createContract(Contracts contract) async {
    contract.number = _numberController.text;
    contract.amount = _amountController as double;
    contract.apartment.code = _apartmentController.text;
    contract.responsible.fullName = _responsibleController.text;
    contract.startDate = _dateController as DateTime;
    // contract.nationalIdentifier = _iinController.text;
    var res = await NewContractRest()
        .createNewContract(contract.number, contract.amount);
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
                      controller: _numberController,
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
                      controller: _amountController,
                      keyboardType: TextInputType.number,
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
                      controller: _apartmentController,
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
                      controller: _responsibleController,
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
                      controller: _dateController,
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
                      //     controller: _lastNameController,
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
                      //       controller: _lastNameController,
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
                      //        controller: _lastNameController,
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
