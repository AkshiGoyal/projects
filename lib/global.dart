import 'package:flutter/material.dart';

displaySnackBar(String msg, GlobalKey<ScaffoldState> _scaffoldKey,
    [Color color = Colors.black87]) {
  final snackBar = SnackBar(
    content: Text(msg),
    backgroundColor: color,
    duration: Duration(milliseconds: 1200),
  );
  _scaffoldKey.currentState.showSnackBar(snackBar);
}
