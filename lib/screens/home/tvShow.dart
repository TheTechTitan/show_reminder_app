import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_reminder_app/models/show.dart';
import 'package:show_reminder_app/screens/home/showList.dart';
import 'package:show_reminder_app/screens/wrapper.dart';
import 'package:show_reminder_app/services/authService.dart';
import 'package:show_reminder_app/services/fireStoreService.dart';

class TvShow extends StatelessWidget {

  //final reminder;
  final String channelId;

  TvShow({this.channelId});

  final AuthenticationService _authService = AuthenticationService(); 

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Show>>.value(
        value: FireStoreService(channelId: channelId).channelShows,
        child: Container(
        
        child: Scaffold(
          backgroundColor: Colors.white12,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
              ), 
              onPressed: () =>Navigator.pop(context),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Center(child: Text('INFINITY SHOWS' , style: TextStyle(color: Colors.blueAccent ))),
            ),
            backgroundColor: Colors.black12,
            elevation: 5,
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
          body: ShowList()
        ),
      ),
    );
  }
}