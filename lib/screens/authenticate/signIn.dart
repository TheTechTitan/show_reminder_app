import 'dart:math';

import 'package:flutter/material.dart';
import 'package:show_reminder_app/screens/home/admin.dart';
import 'package:show_reminder_app/services/authService.dart';

class SignIn extends StatefulWidget {

  final toggleScreen;
  SignIn({this.toggleScreen});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  List colors = [Colors.blue[400],Colors.yellow[500] ,Colors.red[400],Colors.purple[400], Colors.green[400], Colors.brown[400]];
  Random random = new Random();
  int index = 0;

  final AuthenticationService _authenticationService=AuthenticationService();
  final _formKey = GlobalKey<FormState>();

  String email='';
  String pass='';
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

    final email = TextFormField(
      validator: (val) => val.isEmpty ? 'Please enter an Email' : null,
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
      validator: (val) => val.isEmpty ? 'Please enter password' : null,
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

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(24),
        ),
        onPressed: ()async{
          if(_formKey.currentState.validate()){
              if(this.email=='Admin' && this.pass=='Admin'){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Admin();
                }));
              }else{
                dynamic result= await _authenticationService.signIn(this.email, this.pass);
                if(result==null){
                setState(()=> this.error = 'Invalid Credentials' );
              }
            }
          }
        },
        padding: EdgeInsets.all(12),
        color: colors[random.nextInt(6)],
        child: Text('SIGN IN',style: TextStyle(color: Colors.white,fontSize: 17.0)),
      )
    );

    final signUpNow=Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child:GestureDetector(
          child: Text("Dont have an Account? Sign Up Now", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue,fontSize: 18.0)),
          onTap: () {
              widget.toggleScreen();
          }
        ),    
      ),
    );

    final errorInfo=Center(
      child:Text(
        this.error,
        style: TextStyle(color: Colors.red,fontSize: 18.0),
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
              SizedBox(height: 75.0),
              logo,
              SizedBox(height: 30.0),
              email,
              SizedBox(height: 15.0),
              password,
              SizedBox(height: 15.0),
              loginButton,
              SizedBox(height: 2.0),
              signUpNow,
              SizedBox(height: 12.0),
              errorInfo,
            ],
          ),
        ),
      ),
    );
  }
}