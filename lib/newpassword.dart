import 'package:flutter/material.dart';
import 'package:flutter_app2/global.dart';
import 'package:flutter_app2/ui.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    TextEditingController changePasswordController1 = TextEditingController();
    TextEditingController changePasswordController2 = TextEditingController();
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.pink[50],
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 250, 30, 20),
              child: TextField(
                controller: changePasswordController1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'New Password',
                    suffixIcon: Icon(Icons.remove_red_eye)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: TextField(
                controller: changePasswordController2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Confirm Password',
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.remove_red_eye),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 90),
              child: RaisedButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Proceed",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    bool _isCorrect = false;
                    if (changePasswordController1.text !=
                        changePasswordController2.text)
                      displaySnackBar("Password don't match", _scaffoldKey);
                    else if (changePasswordController1.text.length < 8) {
                      displaySnackBar("Enter a password", _scaffoldKey);
                    } else {
                      _isCorrect = true;
                    }

                    if (_isCorrect == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
