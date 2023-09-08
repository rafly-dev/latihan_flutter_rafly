import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_flutter_rafly/providers/BaseProvider.dart';
import 'package:latihan_flutter_rafly/providers/DashboardProvider.dart';
import 'package:latihan_flutter_rafly/views/splash_screen.dart';
import 'package:provider/provider.dart';
import 'helpers/AppLogger.dart';

void main() async {
  runApp(MyApp());
}

/*
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void initialize() {
  FirebaseMessaging.instance.requestPermission();
  // FirebaseMessaging.instance.getToken().then(
  //       (deviceToken) {
  //     if (deviceToken != null) {
  //       _setDeviceTokenUseCase.execute(deviceToken);
  //       AppLogger.log('Device Token: $deviceToken');
  //     }
  //   },
  // );
  FirebaseMessaging.onMessage.listen((message) {
    AppLogger.log('Message data: ${message.data}');
  });
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    AppLogger.log('Message data: ${message.data}');
  });
  FirebaseMessaging.onBackgroundMessage((message) async {
    AppLogger.log('Message data: ${message.data}');
  });
}

Future<void> selectNotification(String payload) async {
  if (payload != null) {
    // Handle notifikasi sesuai dengan payload
    // Contoh: Navigasi ke halaman notifikasi
    print("Payload notifikasi: $payload");
    // Navigasi ke halaman notifikasi
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => NotificationPage(payload: payload)),
    // );
  }
}

void showNotification(RemoteMessage message) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id', // ID kanal notifikasi Anda
    'Your Channel Name', // Nama kanal notifikasi Anda
    // 'Your Channel Description', // Deskripsi kanal notifikasi Anda
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0, // ID notifikasi
    message.notification!.title, // Judul notifikasi
    message.notification!.body, // Isi notifikasi
    platformChannelSpecifics,
    payload: message.data['data'], // Payload notifikasi
  );
}*/

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  final String? payload;

  const MyApp({Key? key, this.payload}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BaseProvider()),
        ChangeNotifierProvider(create: (context) => DashboardProvider()),
      ],
      child: GetMaterialApp(
        // navigatorKey: navigatorKey,
        title: 'Latihan Flutter Rafly',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.poppinsTextTheme(textTheme)),
        home: SplashScreen(),
        // initialRoute: initialRoute,
      ),
    );
  }
}
