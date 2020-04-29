import 'package:flutter/material.dart';
import 'package:show_reminder_app/models/channel.dart';
import 'package:show_reminder_app/screens/home/tvShow.dart';


class ChannelTile extends StatelessWidget {
 
  final Channel channel;
  ChannelTile({this.channel});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: ListTile(
          leading: Image.network(channel.image),
          title: Text(channel.title),
          subtitle: Text(channel.description),
          onTap: (){
            print('tapped channel');
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TvShow(channelId: channel.channelId);
            }));
          },
        ),
      ),
    );
  }
}