import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_reminder_app/models/user.dart';
import 'package:show_reminder_app/screens/wrapper.dart';
import 'package:show_reminder_app/services/authService.dart';
import 'services/authService.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      //What stream are we listening to
      value: AuthenticationService().user,
      child: MaterialApp(
        //wrapper is decendant of stream provider and can access data of stream
        home: Wrapper(),
      ),
    );
  }
}
