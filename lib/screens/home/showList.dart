import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_reminder_app/models/show.dart';
import 'package:show_reminder_app/screens/home/showTile.dart';

class ShowList extends StatefulWidget {
  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  @override
  Widget build(BuildContext context) {

    final shows = Provider.of<List<Show>>(context) ?? [];

    return ListView.builder(
      itemCount: shows.length,
      itemBuilder: (context,index){
        return ShowTile(show : shows[index]);
      },
    );
  }
}