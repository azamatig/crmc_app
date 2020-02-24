import 'package:flutter/material.dart';

class ChessBoardList extends StatefulWidget {
  @override
  _ChessBoardListState createState() => _ChessBoardListState();
}

class _ChessBoardListState extends State<ChessBoardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChessBoard'),
      ),
      body: Container(
        child: Text('Some stuff'),
      ),
    );
  }
}
