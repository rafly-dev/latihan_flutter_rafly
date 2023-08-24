import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan_flutter_rafly/providers/BaseProvider.dart';
import 'package:latihan_flutter_rafly/views/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () async => await checkPref(context));
  }

  Future<void> checkPref(BuildContext context) async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    BaseProvider state = Provider.of(context);

    return Scaffold(
      body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset(
                "assets/images/go_dev_exp.png",
                width: 200,
                height: 200,
              ),
              Image.asset(
                "assets/images/hackerearth.png",
                width: 200,
                height: 100,
              )
            ],
          )),
    );
  }
}
