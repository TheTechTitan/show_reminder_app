import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_reminder_app/models/user.dart';
import 'package:show_reminder_app/screens/authenticate/auth.dart';
import 'package:show_reminder_app/screens/home/home.dart';
//import 'package:show_reminder_app/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    //wrapper is decendant of stream provider and can access data of stream
    final user= Provider.of<User>(context);
    //return either auth or home
    return user ==null ? Authenticate() : Home();
  }
}