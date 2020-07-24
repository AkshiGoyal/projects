import 'package:flutter/material.dart';
import 'package:flutter_app2/ui.dart';
import 'package:regexpattern/regexpattern.dart';

import 'global.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

bool _obsecureIn = true;

class _RegisterState extends State<Register> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController singupMobileNumberController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController singupNameController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Add Details', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.pink[50],
        padding: const EdgeInsets.fromLTRB(20.0, 70, 20, 100),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                'Hello! Sign up to get started',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
              child: TextField(
                controller: singupNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.blue[100],
                    labelText: 'Username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextField(
                controller: singupMobileNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.blue[100],
                    labelText: 'Mobile Number'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextField(
                  controller: signupEmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.blue[100],
                    labelText: ('Email'),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextField(
                controller: signupPasswordController,
                keyboardType: TextInputType.text,
                obscureText: _obsecureIn,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.blue[100],
                    labelText: 'Password',
                    suffixIcon: GestureDetector(
                        child: GestureDetector(
                            child: Icon(Icons.remove_red_eye),
                            onTap: () {
                              setState(() {
                                _obsecureIn = !_obsecureIn;
                              });
                            }))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: RaisedButton(
                color: Colors.pink,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text("Sign up"),
                onPressed: () {
                  bool _isCorrect = false;
                  FocusScope.of(context).unfocus();
                  if (singupNameController.text.length < 2)
                    displaySnackBar(
                        'Please enter a valid user name', _scaffoldKey);
                  else if (RegexValidation.hasMatch(
                          signupEmailController.text, RegexPattern.email) ==
                      false)
                    displaySnackBar(
                        "Please Enter Valid Email ID", _scaffoldKey);
                  else if (signupPasswordController.text.length < 8) {
                    displaySnackBar(
                        'Please enter a valid password', _scaffoldKey);
                  } else if (singupMobileNumberController.text.length != 10)
                    displaySnackBar("Please Enter Valid Name", _scaffoldKey);
                  else if (signupPasswordController.text.length < 8)
                    displaySnackBar("Please Enter Valid Name", _scaffoldKey);
                  else {
                    _isCorrect = true;
                  }
                  if (_isCorrect == true) {
                    if (signupEmailController.text == "shanu18mps@gmail.com") {
                      SnackBar(
                          content: Text('This is Email is already register'));
                    } else {
                      String name = singupNameController.text;
                      String mobilenumber = singupMobileNumberController.text;
                      String email = signupEmailController.text;
                      String password = signupPasswordController.text;
                      print(name);
                      print(mobilenumber);
                      print(email);
                      print(password);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
