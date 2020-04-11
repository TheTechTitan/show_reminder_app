import 'package:flutter/material.dart';
import 'package:show_reminder_app/services/authService.dart';

class Home extends StatelessWidget {

  final AuthenticationService _authService = AuthenticationService(); 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blueAccent[300],
        appBar: AppBar(
          title: Text('Infinity reminder'),
          backgroundColor: Colors.blueAccent[50],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async{
                await _authService.signOut();
              }, 
              icon: Icon(Icons.person), 
              label: Text('Sign Out'),
            ),
          ],
        ),
        body: Container( 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/monkey.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}