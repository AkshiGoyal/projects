import 'package:flutter/material.dart';
import 'package:flutter_app2/global.dart';
import 'package:flutter_app2/newpassword.dart';
import 'package:regexpattern/regexpattern.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController loginEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OnlineShop'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      key: _scaffoldKey,
      body: Container(
        color: Colors.pinkAccent[50],
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 250, 30, 20),
              child: TextField(
                controller: loginEmailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'your email address'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 90),
              child: RaisedButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    bool _isCorrect = false;
                    if (RegexValidation.hasMatch(
                            loginEmailController.text, RegexPattern.email) ==
                        false)
                      displaySnackBar(
                          "Please enter valid emailid", _scaffoldKey);
                    else if (loginEmailController.text.length < 8)
                      displaySnackBar(
                          'PLaese enter a valid email', _scaffoldKey);
                    else {
                      _isCorrect = true;
                    }

                    if (_isCorrect == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewPassword()),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
