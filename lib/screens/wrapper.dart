import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_reminder_app/models/user.dart';
import 'package:show_reminder_app/screens/authenticate/auth.dart';
import 'package:show_reminder_app/screens/home/home.dart';
import 'package:splashscreen/splashscreen.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    //wrapper is decendant of stream provider and can access data of stream
    final user= Provider.of<User>(context);
    //return either auth or home
    if (user==null){
      return Authenticate();
    }else{
      return SplashScreen(
        seconds: 10,
        navigateAfterSeconds: Home(),
        image: new Image.asset(
            'assets/infinity_splash.gif'),
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 250.0,
        onClick: () => print("spashscreen clicked"),
        loaderColor: Colors.white,
        title: Text('WELCOME!', style: TextStyle(color: Colors.blueAccent , fontSize: 35)),
        
      );
    }
  }
}