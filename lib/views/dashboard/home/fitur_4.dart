import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Fitur4 extends StatefulWidget {
  const Fitur4({super.key});

  @override
  State<Fitur4> createState() => _Fitur4State();
}

class _Fitur4State extends State<Fitur4> {
  @override
  void initState() {
    permission();
    super.initState();
  }

  void permission() async {
    Permission permission = Permission.location;
    PermissionStatus permissionStatus = await permission.status;
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await permission.request();
      if (permissionStatus == PermissionStatus.permanentlyDenied) {
        // Permission is denied forever, handle appropriately.
        print('Permission is denied forever, handle appropriately');
        openAppSettings();
        return;
      }

      if (permissionStatus == PermissionStatus.denied) {
        // Permission is denied, next time you could try
        // requesting the permission again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        print('Permission is denied, next time you could try');
        openAppSettings();
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitur 4"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Hit'),
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
