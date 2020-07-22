import 'package:flutter/material.dart';
import 'package:show_reminder_app/models/show.dart';
import 'package:show_reminder_app/services/reminderService.dart';


class ShowTile extends StatelessWidget {

  final Show show;
  ShowTile({this.show});

  final ReminderService _reminderService = ReminderService();

  

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
        child: Card(
        elevation: 30.0,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(16.0),
        ),
        child: new InkWell(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 130,
                  width: 600,
                  child: new ClipRRect(
                  child: Image(
                    fit: BoxFit.cover,
                      image: NetworkImage(
                        show.image,
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
                        new Text(show.title, style: Theme.of(context).textTheme.title),
                        new Text('IMDb  '+show.ratings+'/10',style: Theme.of(context).textTheme.body2),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            IconButton(
                              color: Colors.blueAccent,
                              iconSize: 35,
                              icon: Icon(Icons.schedule),
                              onPressed: () {
                                  _reminderService.showNotificationsAfterSecond(show.title,show.airdate.toDate());
                              },
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                    new Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text('Airdate: '+show.airdate.toDate().toString().substring(0,19)),
                        Text('Remind Me')
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}