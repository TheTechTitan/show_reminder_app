import 'dart:math';

import 'package:flutter/material.dart';
import 'package:show_reminder_app/services/authService.dart';

class SignUp extends StatefulWidget {

  final toggleScreen;
  SignUp({this.toggleScreen});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  List colors = [Colors.blue[400],Colors.yellow[500] ,Colors.red[400],Colors.purple[400], Colors.green[400], Colors.brown[400]];
  Random random = new Random();
  int index = 0;

  final AuthenticationService _authenticationService=AuthenticationService();
  final _formKey = GlobalKey<FormState>();

  String name='';
  String email='';
  String pass=''; 
  String confirmPass=''; 
  String error='';

  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'hero', 
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('assets/infinity.png'),
      ),
    );

    final username = TextFormField(
      validator: (val) => val.isEmpty ? 'Please specify a username' : null,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration( 
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.00, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onChanged: (value){
        setState(() => this.name = value);
      },
    );

    final email = TextFormField(
      validator: (val) => val.isEmpty ? 'Please enter your email' : null,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration( 
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.00, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onChanged: (value){
        setState(() => this.email = value);
      },
    );

    final password = TextFormField(
      validator: (val) => val.length<6 ? 'Password should be 6 or more characters' : null,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration( 
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.00, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onChanged: (value){
        setState(() => this.pass = value);
      },

    );

    final confirmPassword = TextFormField(
      validator: (val) => val != this.pass ? 'Passwords do not match' : null,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration( 
        hintText: 'Confirm Password',
        contentPadding: EdgeInsets.fromLTRB(20.00, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onChanged: (value){
        setState(() => this.confirmPass = value);
      },
    );

    final regButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(12),
        color: colors[random.nextInt(6)],
        child: Text('SIGN UP',style: TextStyle(color: Colors.white,fontSize: 17.0)),
        onPressed: ()async{
          if(_formKey.currentState.validate()){
            dynamic result= await _authenticationService.signUp(this.email, this.pass);
            if(result==null){
              setState(()=> this.error = 'Invalid Email' );
            }
          }
        },
      ),
    );

    final alreadyUser=Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child:GestureDetector(
          child: Text("Already an Infinity User? Click Here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue,fontSize: 18.0)),
          onTap: () {
            widget.toggleScreen();
          }
        ),    
      ),
    );

    final errorInfo=Center(
      child:Text(
        this.error,
        style: TextStyle(color: Colors.red,fontSize: 15.0),
      )
    );

    return Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
              SizedBox(height: 50.0),
              logo,
              SizedBox(height: 10.0),
              username,
              SizedBox(height: 10.0),
              email,
              SizedBox(height: 10.0),
              password,
              SizedBox(height: 10.0),
              confirmPassword,
              SizedBox(height: 10.0),
              regButton,
              SizedBox(height: 5.0),
              alreadyUser,
              SizedBox(height: 2.0),
              errorInfo,
            ],
          ),
        ),
      ),
    );
  }
}