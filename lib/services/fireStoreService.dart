
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:show_reminder_app/models/channel.dart';
import 'package:show_reminder_app/models/show.dart';

class FireStoreService{

  final String channelId;
  FireStoreService({this.channelId});

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
          channelId: doc.documentID,
          title: doc.data['title'] ?? '',
          description: doc.data['description'] ?? '',
          ratings: doc.data['ratings'] ?? 0,
          image: doc.data['image'] ?? ''
        );
    }).toList();
  }

  List<Show> _showFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
        return Show(
          title: doc.data['title'] ?? '',
          airdate: doc.data['airdate'] ?? '',
          ratings: doc.data['ratings'] ?? 0,
          image: doc.data['image'] ?? ''
        );
    }).toList();
  }

  Stream<List<Channel> >get channels{
    return channelCollection.snapshots()
    .map(_channelFromSnapshot);
  }

  Stream<List<Show>> get channelShows {
    return channelCollection.document(channelId).collection('shows')
    .snapshots().map(_showFromSnapshot);
  }

}