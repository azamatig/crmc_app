import 'package:crmc_app/screens/block_list.dart';
import 'package:crmc_app/screens/client_form_add_list.dart';
import 'package:crmc_app/services/create_contract_rest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddNewDeal extends StatefulWidget {
  AddNewDeal(this.id, this.clientId);
  final String id;
  final String clientId;

  @override
  _AddNewDealState createState() => _AddNewDealState(this.id, this.clientId);
}

class _AddNewDealState extends State<AddNewDeal> {
  final String id;
  final String clientId;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');

  String myId;

  _AddNewDealState(this.id, this.clientId);

  @override
  void initState() {
    super.initState();
  }

  //Creates new Contract, sort of...
  createContract() async {
    String number = _numberController.text;
    double amount = _amountController as double;
    var res = await NewContractRest().createNewContract(number, amount);
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
                    Center(child: Text('Пожалуйста, заполните все поля')),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 0.80),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          initialValue: '${widget.id}' != null
                              ? '${widget.id}'
                              : 'Выбрать недвижимость',
                          style: TextStyle(fontSize: 18.0),
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ComplexList())),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.text_fields,
                              size: 30.0,
                            ),
                            labelText: '№ Недвижиости',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 0.80),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 0.80),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          initialValue: formatter.format(now),
                          //  controller: _responsibleController,
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.perm_contact_calendar,
                              size: 30.0,
                            ),
                            labelText: 'Дата',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 0.80),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          initialValue: '${widget.clientId}' != null
                              ? '${widget.clientId}'
                              : 'Выбрать клиента',
                          //    controller: _dateController,
                          style: TextStyle(fontSize: 18.0),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ClientFormData())),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.place,
                              size: 30.0,
                            ),
                            labelText: 'Клиент',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Center(child: Text('Тип клиента')),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 165,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 0.80),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: DropdownButton<ClientType>(
                                  hint: Text("Тип клиента"),
                                  value: selectedType,
                                  onChanged: (ClientType value) {
                                    setState(() {
                                      selectedType = value;
                                    });
                                  },
                                  items: type.map((ClientType clientType) {
                                    return DropdownMenuItem<ClientType>(
                                      value: clientType,
                                      child: Row(
                                        children: <Widget>[
                                          clientType.icon,
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            clientType.type,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: <Widget>[
                            Center(child: Text('Условия оплаты')),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 0.80),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: DropdownButton<Payments>(
                                  hint: Text("Условия оплаты"),
                                  value: selectedPayment,
                                  onChanged: (Payments shmalue) {
                                    setState(() {
                                      selectedPayment = shmalue;
                                    });
                                  },
                                  items: payment.map((Payments payment) {
                                    return DropdownMenuItem<Payments>(
                                      value: payment,
                                      child: Row(
                                        children: <Widget>[
                                          payment.icon,
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            payment.condition,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(child: Text('Подписант')),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 0.80),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                        child: DropdownButton<Managers>(
                          hint: Text("Подписант"),
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
                      ),
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
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a updatus.
                              createContract(); //fun1
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
      )),
  const Managers(
      'Пак Елена',
      Icon(
        FontAwesomeIcons.female,
      )),
  const Managers(
      'Азамат Мухамеджанов',
      Icon(
        FontAwesomeIcons.male,
      )),
  const Managers(
      'Сауле Садыкова',
      Icon(
        FontAwesomeIcons.female,
      )),
  const Managers(
      'Асель Авкешова',
      Icon(
        FontAwesomeIcons.female,
      )),
];

class Payments {
  const Payments(this.condition, this.icon);
  final String condition;
  final Icon icon;
}

Payments selectedPayment;
List<Payments> payment = <Payments>[
  const Payments(
      '100%',
      Icon(
        FontAwesomeIcons.paypal,
      )),
  const Payments(
      'Рассрочка',
      Icon(
        FontAwesomeIcons.paypal,
      )),
  const Payments(
      '100% или рассрочка',
      Icon(
        FontAwesomeIcons.paypal,
      )),
];

class ClientType {
  const ClientType(this.type, this.icon);
  final String type;
  final Icon icon;
}

ClientType selectedType;
List<ClientType> type = <ClientType>[
  const ClientType(
      'Физ.лицо',
      Icon(
        FontAwesomeIcons.male,
      )),
  const ClientType(
      'Юр.лицо',
      Icon(
        FontAwesomeIcons.male,
      )),
];
