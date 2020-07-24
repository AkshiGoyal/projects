import 'package:flutter/material.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Welcome'));
  }
}
