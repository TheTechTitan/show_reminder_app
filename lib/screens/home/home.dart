import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_reminder_app/models/channel.dart';
import 'package:show_reminder_app/screens/home/channelList.dart';
import 'package:show_reminder_app/screens/wrapper.dart';
import 'package:show_reminder_app/services/authService.dart';
import 'package:show_reminder_app/services/fireStoreService.dart';

class Home extends StatelessWidget {

  final AuthenticationService _authService = AuthenticationService(); 

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Channel>>.value(
        value:  FireStoreService().channels,
        child: Container(
        child: Scaffold(
          backgroundColor: Colors.white12,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Center(child: Text('INFINITY CHANNELS' , style: TextStyle(color: Colors.blueAccent ))),
            ),
            backgroundColor: Colors.black12,
            elevation:  5,
            actions: <Widget>[
              FlatButton.icon(
                textColor: Colors.white,
                onPressed: () async{
                  await _authService.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Wrapper()),
                  );
                }, 
                icon: Icon(Icons.exit_to_app), 
                label: Text('Sign Out'),
              ),
            ],
          ),
          body:  ChannelList()
        ),
      ),
    );
  }
}