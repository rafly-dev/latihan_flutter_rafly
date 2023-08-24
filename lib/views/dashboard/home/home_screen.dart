import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:latihan_flutter_rafly/views/dashboard/home/fitur_1.dart';
import '../../../theme.dart';

Widget HomeScreen(BuildContext context) {
  return CustomScrollView(
    primary: false,
    slivers: <Widget>[
      SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: SliverGrid.count(
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          crossAxisCount: 2,
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 100,
              child: ElevatedButton(
                style: BaseTheme().styleElevatedButton,
                onPressed: () {
                  Get.to(() => Fitur1);
                },
                child: const Text('fitur 1'),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
