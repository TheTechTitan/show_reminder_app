import 'package:flutter/material.dart';
import 'package:show_reminder_app/screens/authenticate/signIn.dart';
import 'package:show_reminder_app/screens/authenticate/signUp.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn= true ;
  void toggleScreen(){
    setState(() => showSignIn = !showSignIn);
  } 

  @override
  Widget build(BuildContext context) {
     
     return showSignIn ? SignIn(toggleScreen:toggleScreen) : SignUp(toggleScreen:toggleScreen);     
  }
}