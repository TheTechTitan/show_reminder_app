
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:show_reminder_app/models/channel.dart';

class FireStoreService{

  final CollectionReference channelCollection=Firestore.instance.collection('channels');

 /*  Future updateChannelData(String title, String des, double rating)async{

    return await channelCollection.document().setData({
      'title' : title,
      'description' : des,
      'rating' : rating
    });
  } */

  //channel from snapshot
  List<Channel> _channelFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
        return Channel(
          title: doc.data['title'] ?? '',
          description: doc.data['description'] ?? '',
          ratings: doc.data['ratings'] ?? 0,
          image: doc.data['image'] ?? ''
        );
    }).toList();
  }

  Stream<List<Channel> >get channels{
    return channelCollection.snapshots().map(_channelFromSnapshot);
  }

}