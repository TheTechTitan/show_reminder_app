import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreAdminService {
  final String channelId;
  FireStoreAdminService({this.channelId});

  final CollectionReference channelCollection =
      Firestore.instance.collection('channels');

  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  //add channels
  Future<void> addData(showData) async {
    if (isLoggedIn()) {
      Firestore.instance.runTransaction((Transaction crudTransaction) async {
        CollectionReference reference =
            Firestore.instance.collection('channels');

        reference.add(showData);
      });
    } else {
      print('You need to be logged in');
    }
  }

  getData() async {
    return await Firestore.instance.collection('channels').snapshots();
  }

  //update channels
  updateData(selectedDoc, newValues) {
    Firestore.instance
        .collection('channels')
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
      print(e);
    });
  }

  //delete channels
  deleteData(docId) {
    Firestore.instance
        .collection('channels')
        .document(docId)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  getchannelShows() async {
    return await Firestore.instance
        .collection('channels')
        .document(channelId)
        .collection('shows')
        .snapshots();
  }
}
