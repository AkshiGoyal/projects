import 'dart:ui';
//import 'package:flutter_ui_splash_screen/homeScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app2/ChangePassword.dart';
import 'package:flutter_app2/register.dart';
import 'package:flutter_app2/welcome.dart';
import 'package:regexpattern/regexpattern.dart';

import 'global.dart';
//import 'package:flutter_gradients/flutter_gradients.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/564x/b2/74/33/b27433c97e07d751d28fbd7c6dce4b31.jpg"),
                fit: BoxFit.cover)),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 160, 20, 150),
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey.withOpacity(0.1),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                            child: Center(
                                child: Text(
                          'Hello again , Welcome back.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Quicksand'),
                        ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                        child: TextField(
                          controller: loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail_outline),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Email Address'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: TextField(
                          controller: loginPasswordController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Password',
                              suffixIcon: Icon(Icons.remove_red_eye)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 10, 60, 0),
                        child: RaisedButton(
                          color: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onPressed: () {
                            //print('logged in');
                            bool _isloading = false;
                            if (RegexValidation.hasMatch(
                                    loginEmailController.text,
                                    RegexPattern.email) ==
                                false)
                              displaySnackBar(
                                  "Please enter valid email id", _scaffoldKey);
                            else if (loginEmailController.text.length < 8)
                              displaySnackBar('Please enter a valid email id',
                                  _scaffoldKey);
                            else {
                              _isloading = true;
                            }
                            if (_isloading == true) {
                              if (loginEmailController.text ==
                                      "shanu18mps@gmail.com" &&
                                  loginPasswordController.text == "123123") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Welcome()),
                                );
                              } else {
                                displaySnackBar('Invalid email id or password',
                                    _scaffoldKey);
                                loginEmailController.text = " ";
                                loginPasswordController.text = " ";
                              }
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 170.0, top: 5),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChangePassword()),
                              );
                            },
                            child: Center(
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                      SizedBox(height: 35.0),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          },
                          child: Center(
                            child: Text(
                              "Are you a newbie? SIGN UP",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
