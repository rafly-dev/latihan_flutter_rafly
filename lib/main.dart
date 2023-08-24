import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_flutter_rafly/providers/BaseProvider.dart';
import 'package:latihan_flutter_rafly/providers/DashboardProvider.dart';
import 'package:latihan_flutter_rafly/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider (
      providers: [
        ChangeNotifierProvider(create: (context) => BaseProvider()),
        ChangeNotifierProvider(create: (context) => DashboardProvider()),
      ],
      child: GetMaterialApp(
        title: 'Latihan Flutter Rafly',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.poppinsTextTheme(textTheme)),
        home: SplashScreen(),
      ),
    );
  }
}
