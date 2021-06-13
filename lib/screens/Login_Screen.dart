
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/constant.dart';
import 'package:lets_chat/screens/Chat_Screen.dart';


class LoginScreen extends StatefulWidget {
  static const String id = "Login Screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email ="";
  String password ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 20,color: Colors.black),
              onChanged: (value) {
                setState(() {
                  email=value;
                });
                //Do something with the user input.
              },
              decoration: kInputDecoration.copyWith(hintText: "E-mail"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              //obscureText: true,
              style: TextStyle(fontSize: 20,color: Colors.black),
              onChanged: (value) {
                setState(() {
                  password=value;
                });
                //Do something with the user input.
              },
              decoration: kInputDecoration.copyWith(hintText: "Password"),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    try {
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if(newUser != null)
                      {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    }
                    catch(e){
                      print(e);
                    }//Implement registration functionality.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}