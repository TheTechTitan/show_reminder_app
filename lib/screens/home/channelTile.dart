import 'package:flutter/material.dart';
import 'package:show_reminder_app/models/channel.dart';
import 'package:show_reminder_app/screens/home/tvShow.dart';


class ChannelTile extends StatelessWidget {
 
  final Channel channel;
  ChannelTile({this.channel});
 
  @override
  Widget build(BuildContext context)  {
    return Padding(
        padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
        child: Container(
    
        decoration: BoxDecoration(
            color: Colors.white,
            //shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ) 
          ),
        child: new InkWell(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 330,
                  width: 600,
                  child: new ClipRRect(
                  child: Image(
                    fit: BoxFit.cover,
                      image: NetworkImage(
                        channel.image,
                      ) 
                    ),
                  borderRadius: BorderRadius.only(
                    topLeft: new Radius.circular(16.0),
                    topRight: new Radius.circular(16.0),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: <Widget>[
                        new Text(channel.title, style: Theme.of(context).textTheme.title),
                        new Text('Viewer Rating  '+channel.ratings+'/10',style: Theme.of(context).textTheme.body2),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            IconButton(
                              color: Colors.blueAccent,
                              iconSize: 35,
                              icon: Icon(Icons.tv),
                              onPressed: () {
                                  
                              },
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: Text(
                            channel.description,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
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