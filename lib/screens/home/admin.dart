import 'dart:io';
import 'package:flutter/material.dart';
import 'package:show_reminder_app/services/fireStoreAdminService.dart';


class Admin extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}
 
class _AdminPageState extends State<Admin> {
   String title;
   String description;
   String ratings;
   String subtitle;
   String image;
   String channelId;
   File sampleImage;

   Stream channel;
 
 FireStoreAdminService crudObject = new FireStoreAdminService();


 
 //add data
  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Channel', style: TextStyle(fontSize: 15.0)),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Enter title'),
                  onChanged: (value) {
                    this.title = value;
                  },
                ),
                SizedBox(height: 5.0),

                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal:true),
                  decoration: InputDecoration(hintText: 'Enter ratings'),
                  onChanged: (value) {
                    this.ratings = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter description'),
                  onChanged: (value) {
                    this.description = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Add image'),
                  onChanged: (value) {
                    this.image = value;
                  },
                ),
                SizedBox(height: 5.0),
                
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Add'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  crudObject.addData({
                    'title': this.title,
                    'description': this.description,
                    'ratings': this.ratings,
                     'image': " ",


                  }).then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }
 
  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(' Message', style: TextStyle(fontSize: 15.0)),
            content: Text('Successfully added'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }



  @override
  void initState(){
    crudObject.getData().then(( results) {
      setState(() {
        channel = results;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Admin'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                addDialog(context);
              },
            ),
            
          ],
        ),
        body: Center(
          child: _channelList()),
 
        );
  }

  //get channel list
  Widget _channelList(){
    if(channel != null){
                return StreamBuilder(
              stream: channel,
              builder:(context, snapshot){
                return ListView.builder(
              itemCount: snapshot.data.documents.length,
              padding: EdgeInsets.all(4.0),
              itemBuilder: (context, i){
                return new ListTile(
                  title: Text(snapshot.data.documents[i].data['title']),
                  subtitle : Text(snapshot.data.documents[i].data['description']),
              

                  leading: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(0.0)),
                          CircleAvatar(
                            backgroundImage: NetworkImage((snapshot.data.documents[i].data['image'])),
                            radius: 28.0,
                            ),
                        ],
                        
                  ),
                  trailing: Row(mainAxisSize:MainAxisSize.min,
                  
                  children: <Widget>[
                  Row(
                    
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text( snapshot.data.documents[i].data['ratings']),
                       
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            IconButton(
                              color: Colors.blueAccent,
                              icon: Icon(Icons.delete_outline,
                                size:16.0,
                                color: Colors.grey,
                              ),
                            onPressed:(){
                              crudObject.deleteData(snapshot.data.documents[i].documentID);
                              },
                            ),
	                          ],
                        ),
                      ],

                    ),

                  
                  ],
                  
                  ),
                  onLongPress: (){
                     updateDialog(context, snapshot.data.documents[i].documentID);
                  },
                   
                );
                }, 

          );
        },
      );
    } else{
      return Text('Please wait...');
    }
  }



//update channel
Future<bool> updateDialog(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update Channel', style: TextStyle(fontSize: 15.0)),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Update title'),
                  
                  onChanged: (value) {
                    this.title = value;
                  },
                ),
                SizedBox(height: 5.0),

                TextField(
                  //keyboardType: TextInputType.numberWithOptions(decimal:true),
                  decoration: InputDecoration(hintText: 'Update ratings'),
                  
                  onChanged: (value) {
                    this.ratings = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Update description'),
                  onChanged: (value) {
                    this.description = value;
                  },
                ),
                SizedBox(height: 5.0),
               
                SizedBox(height: 5.0),
                

              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Update'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  crudObject.updateData(selectedDoc,{
                    'title': this.title,
                    'description': this.description,
                    'ratings': this.ratings,
                    'image': " ",


                  }).then((result) {
                    //dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        });
  }

}