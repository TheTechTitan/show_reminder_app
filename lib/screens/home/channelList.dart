import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_reminder_app/models/channel.dart';
import 'package:show_reminder_app/screens/home/channelTile.dart';


class ChannelList extends StatefulWidget {
  @override
  _ChannelListState createState() => _ChannelListState();
}

class _ChannelListState extends State<ChannelList> {
  
  int _current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  
  
  @override
  Widget build(BuildContext context) {
    
    final channels = Provider.of<List<Channel>>(context);

    return Container(
        
        child: (channels==null)? 
              CircularProgressIndicator()
               : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          
          children: <Widget>[
            Center(child: Text('Explore Channels' , style: TextStyle(color: Colors.white60, fontSize: 30))),
            Center(child: Text('Schedule your Favorite TV Shows' , style: TextStyle(color: Colors.white60, fontSize: 30))),
            CarouselSlider(
              height: 560.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: channels.map((channel) {
                return Builder(
                  builder: (BuildContext context) {
                    return ChannelTile(channel: channel);
                  },
                );
              }).toList(),
            ),
            
            Padding(
                padding: EdgeInsets.only(top: 25),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(channels, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index ? Colors.blueAccent : Colors.white38,
                    ),
                  );
                }),
              ), 
            ),
          ],
        ),
      );
  }
}