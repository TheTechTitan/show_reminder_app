import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_reminder_app/models/channel.dart';
import 'package:show_reminder_app/screens/home/channelTile.dart';


class ChannelList extends StatefulWidget {
  @override
  _ChannelListState createState() => _ChannelListState();
}

class _ChannelListState extends State<ChannelList> {
  @override
  Widget build(BuildContext context) {
    
    final channels = Provider.of<List<Channel>>(context) ?? [];

    return ListView.builder(
      itemCount: channels.length,
      itemBuilder: (context,index){
        return ChannelTile(channel : channels[index]);
      },
    );
  }
}