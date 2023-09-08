import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Fitur1 extends StatefulWidget {
  const Fitur1({super.key});

  @override
  State<Fitur1> createState() => _Fitur1State();
}

class _Fitur1State extends State<Fitur1> {
  final ImagePicker _picker = ImagePicker();

  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Capture Image from Camera"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
          child: Column(children: [
        Container(
            height: 600,
            width: 400,
            child: controller == null
                ? Center(child: Text("Loading Camera..."))
                : !controller!.value.isInitialized
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CameraPreview(controller!)),
        ElevatedButton.icon(
          //image capture button
          onPressed: () async {
            try {
              if (controller != null) {
                //check if contrller is not null
                if (controller!.value.isInitialized) {
                  //check if controller is initialized
                  image = await controller!.takePicture(); //capture image
                  setState(() {
                    //update UI
                    Get.dialog(AlertDialog(
                      content: Image.file(
                        File(image!.path),
                        height: 300,
                      ),
                    ));
                  });
                }
              }
            } catch (e) {
              print(e); //show error
            }
          },
          icon: Icon(Icons.camera),
          label: Text("Capture"),
        ),
        // Container(
        //   //show captured image
        //   padding: EdgeInsets.all(30),
        //   child: image == null
        //       ? Text("No image captured")
        //       : Image.file(
        //           File(image!.path),
        //           height: 300,
        //         ),
        //   //display captured image
        // )
      ])),
    );
  }

  @override
  void deactivate() {
    if (controller!.value.isStreamingImages) {
      controller?.stopImageStream(); // Stop camera preview
    }
    print('deactivate fitur_1');
    super.deactivate();
  }

  @override
  void dispose() {
    // Dispose the camera controller only if it's not streaming images
    if (!controller!.value.isStreamingImages) {
      controller?.dispose();
    }
    print('disposed fitur_1');
    super.dispose();
  }
}
