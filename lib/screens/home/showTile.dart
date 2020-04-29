import 'package:flutter/material.dart';
import 'package:show_reminder_app/models/show.dart';

class ShowTile extends StatelessWidget {

  final Show show;
  ShowTile({this.show});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Padding(
        padding: EdgeInsets.all(10),
              child: FittedBox(
          
          child: Card(
            elevation: 15,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                    topRight: new Radius.circular(16.0),
                  ),
                  child: Image(
                    fit: BoxFit.cover,
                      image: NetworkImage(
                        show.image,
                      ) 
                    ),
                  ),     
                ),
              new Padding(
              padding: new EdgeInsets.all(10.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(show.title, style: Theme.of(context).textTheme.title),
                  SizedBox(height: 10.0),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Airdate: '+ show.airdate.toDate().toString()),
                      Text('Ratings: '+show.ratings.toString()),
                    ],
                  ),
                ],
              ),
            ),
                ],
            ),
          ),
        ),
      ),
    );
  }
  
}