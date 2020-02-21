import 'package:crmc_app/screens/editors/edit_contract_screen.dart';
import 'package:flutter/material.dart';

class ContractDetailsScreen extends StatefulWidget {
  final String number;
  final String amountAndCurrency;
  final String shortName;
  final String code;
  final String name;
  final String currency;

  ContractDetailsScreen(this.number, this.amountAndCurrency, this.shortName,
      this.code, this.name, this.currency);

  @override
  _ContractDetailsScreenState createState() => _ContractDetailsScreenState(
      this.number,
      this.amountAndCurrency,
      this.shortName,
      this.code,
      this.name,
      this.currency);
}

class _ContractDetailsScreenState extends State<ContractDetailsScreen> {
  final String number;
  final String amountAndCurrency;
  final String shortName;
  final String code;
  final String name;
  final String currency;

  _ContractDetailsScreenState(this.number, this.amountAndCurrency,
      this.shortName, this.code, this.name, this.currency);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Информация',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body:
          _details(number, amountAndCurrency, shortName, code, name, currency),
    );
  }

  Widget _details(number, amountAndCurrency, shortName, code, name, currency) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Информация о Договоре',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                            ),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EditContractScreen(
                                        number,
                                        amountAndCurrency,
                                        shortName,
                                        code,
                                        name))),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.library_books,
                            size: 14,
                            color: Colors.blueGrey[300],
                          ),
                          SizedBox(width: 3),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ФИО Клиента:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.blueGrey[300],
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Тип договора:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.blueGrey[300],
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.code,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Общая информация",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'ФИО Клиента:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.blueGrey[300],
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Номер и дата договора:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.blueGrey[300],
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.number,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Сумма:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.blueGrey[300],
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.amountAndCurrency + " " + widget.currency,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Менеджер',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                          // Вторая часть листа
                          children: <Widget>[
                            SizedBox(height: 20),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.shortName,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
