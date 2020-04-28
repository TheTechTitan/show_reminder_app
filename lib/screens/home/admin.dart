import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final uploadButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(24),
        ),
        onPressed: ()async{
          //await FireStoreService().updateChannelData('Fox (test)', 'desc fox', 8.1 );
        },
        padding: EdgeInsets.all(12),
        color: Colors.blue[400],
        child: Text('Upload',style: TextStyle(color: Colors.white,fontSize: 17.0)),
      )
    );

    return Container(
      child: Scaffold(
        body: uploadButton,
      ),
    );
  }
}