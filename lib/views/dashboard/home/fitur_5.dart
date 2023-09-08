import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latihan_flutter_rafly/views/dashboard/home/fitur_5_1.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../helpers/consts.dart';
import '../../../helpers/firebase_notification_handler.dart';
import '../../../services/notification_service.dart';

class Fitur5 extends StatefulWidget {
  const Fitur5({super.key});

  @override
  State<Fitur5> createState() => _Fitur5State();
}

class _Fitur5State extends State<Fitur5> {
  FirebaseNotificationHandler firebaseNotificationHandler = FirebaseNotificationHandler();

  @override
  void initState() {

    super.initState();
  }

  Future<void> showNotification(Map<String, dynamic> message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'Your Channel Name',
      // 'Your Channel Description',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0, // ID notifikasi unik
      message['notification']['title'].toString(),
      message['notification']['body'].toString(),
      platformChannelSpecifics,
      payload: message['data']['click_action'].toString(),
      // message['notification']['title'].toString(),
      // message['notification']['body'].toString(),
      // platformChannelSpecifics,
      // payload: message['data']['click_action'].toString(),
    );
  }


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebasse Cloud Messaging FCM Push Notifications"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            firebaseNotificationHandler.getToken().then((String? value) async {
              Map<String, dynamic> requestBody = {
                // 'to': '$value',
                // 'priority': 'high',
                // 'notification': {
                //   'title': 'Notif Rafly',
                //   'body': 'Body Notif',
                // },
                // 'data': {'type': 'msg'},
                "to": "$value",
                "priority": "high",
                "notification": {
                  "title": "this is a title of notification",
                  "body": "this is a body of notification",
                  "click_action": "FLUTTER_NOTIFICATION_CLICK"
                },
                "data": {
                  "title": "this is a title of data",
                  "body": "this is a body of data",
                  "sound": "default",
                  "status": "done",
                  "screen": "screenA",
                  'type': 'msg'
                }
              };
              await post(
                Uri.parse('https://fcm.googleapis.com/fcm/send'),
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization':
                      'key=AAAACBqcfH8:APA91bGqIBD6RsBNcti0KY6DuB6sXeShaR1v2nRzPFHxWc4BnvpTm3FgB9tKdrwsf4sJqkbIH-3wNRj0d_J7N2AlPcqwKk9WE6GEujQvQf6BrlI4CEMT-9B-MxGQxiq5NsGF-NBkw34-',
                },
                body: jsonEncode(requestBody),
              );
            });
          },
          child: Text('Send Notif'),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    print('deactivate fitur_5');
    super.deactivate();
  }

  @override
  void dispose() {
    print('disposed fitur_5');
    super.dispose();
  }
}
