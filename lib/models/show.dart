import 'package:cloud_firestore/cloud_firestore.dart';

class Show{

  final String title;
  final Timestamp airdate;
  final String ratings;
  final String image;

  Show({this.title,this.airdate,this.ratings,this.image});

}