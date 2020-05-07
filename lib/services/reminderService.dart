import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ReminderService {

  
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

  
  void initializing() async {
    print('iam initialisedddddddd');
    androidInitializationSettings = AndroidInitializationSettings('app_icon');
    iosInitializationSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(
        androidInitializationSettings, iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification : onSelectNotification);
  }

  Future onSelectNotification(String payLoad) async {
    if (payLoad != null) {
      print(payLoad);
    }

    // we can set navigator to navigate another screen
  }
  

  /* void _showNotifications() async {
    await notification();
  } */

  void showNotificationsAfterSecond() async {
    initializing();
    await notificationAfterSec();
  }

  /* Future<void> notification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'Channel ID', 'Channel title', 'channel body',
            priority: Priority.High,
            importance: Importance.Max,
            ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(androidNotificationDetails, iosNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0, 'Hello there', 'Watch Full Episodes of "Emergent" Streaming Now on Hulu.', notificationDetails);
  } */

  Future<void> notificationAfterSec() async {
    //schdeuling for 5 seconds after click
    var timeDelayed = DateTime.now().add(new Duration(seconds: 5));
    print(timeDelayed);
    AndroidNotificationDetails androidNotificationDetails =new AndroidNotificationDetails(
            'second channel ID', 'seconf Channel title', 'second channel body',
            priority: Priority.High,
            importance: Importance.Max,
            ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails = new NotificationDetails(androidNotificationDetails, iosNotificationDetails);
    await flutterLocalNotificationsPlugin.schedule(1, 'Hello there',
        'Watch Full Episodes of "Emergent" Streaming Now on Hulu.', timeDelayed, notificationDetails);
  }

  

	//schdeuling a weekly reminder
  // Future<void> _showWeeklyAtDayAndTime() async {
  //   var time = Time(10, 0, 0);
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //       'show weekly channel id',
  //       'show weekly channel name',
  //       'show weekly description');
  //   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  //   var platformChannelSpecifics = NotificationDetails(
  //       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
  //       0,
  //       'show weekly title',
  //       'Weekly notification shown on Monday at approximately',
  //       Day.Monday,
  //       time,
  //       platformChannelSpecifics);
  // }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print("");
            },
            child: Text("Okay")),
      ],
    );
  }

}