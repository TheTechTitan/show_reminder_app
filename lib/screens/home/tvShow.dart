import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_reminder_app/models/show.dart';
import 'package:show_reminder_app/screens/home/showList.dart';
import 'package:show_reminder_app/services/authService.dart';
import 'package:show_reminder_app/services/fireStoreService.dart';

class TvShow extends StatelessWidget {

  final String channelId;
  TvShow({this.channelId});

  final AuthenticationService _authService = AuthenticationService(); 

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Show>>.value(
        value: FireStoreService(channelId: channelId).channelShows,
        child: Container(
        child: Scaffold(
          backgroundColor: Colors.blueAccent[300],
          appBar: AppBar(
            title: Text('Infinity shows'),
            backgroundColor: Colors.blueAccent[50],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                onPressed: () async{
                  await _authService.signOut();
                  Navigator.pop(context);
                }, 
                icon: Icon(Icons.person), 
                label: Text('Sign Out'),
              ),
            ],
          ),
          body: ShowList()
        ),
      ),
    );
  }
}