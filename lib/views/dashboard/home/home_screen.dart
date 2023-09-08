import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:latihan_flutter_rafly/views/dashboard/home/fitur_1.dart';
import 'package:latihan_flutter_rafly/views/dashboard/home/fitur_2.dart';
import 'package:latihan_flutter_rafly/views/dashboard/home/fitur_4.dart';
import 'package:latihan_flutter_rafly/views/dashboard/home/fitur_5_1.dart';
import 'package:overlay_support/overlay_support.dart';
import '../../../BaseTheme.dart';
import '../../../main.dart';
import '../../../models/push_notification.dart';
import 'fitur_3.dart';
import 'fitur_5.dart';
import 'fitur_6.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class HomeScreen extends StatefulWidget {
  HomeScreen(BuildContext context, {Key? key}) : super(key: key);
  static final String routename = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final FirebaseMessaging _messaging;
  late int _totalNotifications;
  PushNotification? _notificationInfo;

  void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print(
            'Message title: ${message.notification?.title}, body: ${message
                .notification?.body}, data: ${message.data}');

        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body'],
        );

        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });

        if (_notificationInfo != null) {
          // For displaying the notification as an overlay
          showSimpleNotification(
            Text(_notificationInfo!.title!),
            leading: NotificationBadge(totalNotifications: _totalNotifications),
            subtitle: Text(_notificationInfo!.body!),
            background: Colors.cyan.shade700,
            duration: Duration(seconds: 2),
          );
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  // For handling notification when the app is in terminated state
  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
        dataTitle: initialMessage.data['title'],
        dataBody: initialMessage.data['body'],
      );

      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    }
  }

  @override
  void initState() {
    _totalNotifications = 0;
    registerNotification();
    checkForInitialMessage();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );

      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    });

    /*FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("onMessage: $message");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("onMessageOpenedApp: $message");

      if (message.data["navigation"] == "/fitur5_1") {
        int _yourId = int.tryParse(message.data["id"]) ?? 0;
        // Navigator.push(
            // navigatorKey.currentState!.context,
            // MaterialPageRoute(
            //     builder: (context) => Fitur5_1(
            //           yourId: _yourId,
            //           payload: '',
            //           info: null,
            //         )));
      }
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16), // Add padding around the content
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: BaseTheme().styleElevatedButton,
                      onPressed: () {
                        Get.to(() => Fitur1());
                      },
                      child: const Text('fitur 1'),
                    ),
                    SizedBox(width: 15), // Add spacing between buttons
                    ElevatedButton(
                      style: BaseTheme().styleElevatedButton,
                      onPressed: () {
                        Get.to(() => Fitur2());
                      },
                      child: const Text('fitur 2'),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: BaseTheme().styleElevatedButton,
                      onPressed: () {
                        Get.to(() => Fitur3());
                      },
                      child: const Text('fitur 3'),
                    ),
                    SizedBox(width: 15), // Add spacing between buttons
                    ElevatedButton(
                      style: BaseTheme().styleElevatedButton,
                      onPressed: () {
                        Get.to(() => Fitur4());
                      },
                      child: const Text('fitur 4'),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: BaseTheme().styleElevatedButton,
                      onPressed: () {
                        Get.to(() => Fitur5());
                      },
                      child: const Text('Push Notif FCM'),
                    ),
                    SizedBox(width: 15), // Add spacing between buttons
                    ElevatedButton(
                      style: BaseTheme().styleElevatedButton,
                      onPressed: () {
                        Get.to(() => Fitur6());
                      },
                      child: const Text('Lokal Notif'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Widget HomeScreen(BuildContext context) {}
class NotificationBadge extends StatelessWidget {
  final int totalNotifications;

  const NotificationBadge({required this.totalNotifications});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$totalNotifications',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}