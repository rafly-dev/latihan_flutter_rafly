import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ProfileScreen(BuildContext context) {
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
              "assets/images/hackerearth.png",
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 100,
            ),
          ],
        )),
  );
}
