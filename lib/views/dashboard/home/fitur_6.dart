import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../helpers/consts.dart';

class Fitur6 extends StatefulWidget {
  const Fitur6({super.key});

  @override
  State<Fitur6> createState() => _Fitur6State();
}

class _Fitur6State extends State<Fitur6> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        id++, 'plain title', 'plain body', notificationDetails,
        payload: 'item x');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Notif"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _showNotification();
          },
          child: Text('Send Local Notif'),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    // if (controller!.value.isStreamingImages) {
    //   controller?.stopImageStream(); // Stop camera preview
    // }
    print('deactivate fitur_4');
    super.deactivate();
  }

  @override
  void dispose() {
    // Dispose the camera controller only if it's not streaming images
    // if (!controller!.value.isStreamingImages) {
    //   controller?.dispose();
    // }
    print('disposed fitur_4');
    super.dispose();
  }
}
