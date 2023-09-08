import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Fitur3 extends StatefulWidget {
  const Fitur3({super.key});

  @override
  State<Fitur3> createState() => _Fitur3State();
}

class _Fitur3State extends State<Fitur3> {
  @override
  void initState() {
    super.initState();
  }

  AppBar buildAppBar({
    required String appBarTitle,
    bool? centerTitle,
    List<Widget>? actionWidgets,
  }) =>
      AppBar(
        title: Text(appBarTitle),
        centerTitle: centerTitle ?? true,
        backgroundColor: Colors.teal,
        actions: actionWidgets ?? [],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(appBarTitle: "title"),
      body: Center(
        child: PrimaryBtn(
          btnFun: () => _getFromGallery(context),
          btnText: 'Pick Image',
        ),
      ),
    );
  }

  @override
  void deactivate() {
    // if (controller!.value.isStreamingImages) {
    //   controller?.stopImageStream(); // Stop camera preview
    // }
    print('deactivate fitur_3');
    super.deactivate();
  }

  @override
  void dispose() {
    // Dispose the camera controller only if it's not streaming images
    // if (!controller!.value.isStreamingImages) {
    //   controller?.dispose();
    // }
    print('disposed fitur_3');
    super.dispose();
  }
}

/// Get from gallery
_getFromGallery(context) async {
  try {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  } catch (e) {
    print(e.toString());
  }
}

showAlertDialog(context) => showCupertinoDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Permission Denied'),
        content: const Text('Allow access to gallery and photos'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => openAppSettings(),
            child: const Text('Settings'),
          ),
        ],
      ),
    );

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({Key? key, required this.btnText, required this.btnFun})
      : super(key: key);
  final String btnText;
  final Function btnFun;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => btnFun(),
      style: getBtnStyle(context),
      child: Text(btnText),
    );
  }

  getBtnStyle(context) => ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.teal,
      fixedSize: Size(MediaQuery.of(context).size.width - 40, 47),
      textStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 20));
}
