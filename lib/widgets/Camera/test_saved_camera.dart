import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:msocial/my_code.dart';
import 'package:video_player/video_player.dart';

import 'CameraTypes.dart';

class CapturedImage extends StatefulWidget {
  Uint8List? imageData;
  VideoPlayerController? videoController;
  XFile? imageFile;
  bool? isFront;
  CapturedImage(
      {Key? key,
      this.imageData,
      this.videoController,
      this.imageFile,
      this.isFront})
      : super(key: key);

  @override
  State<CapturedImage> createState() => _CapturedImageState();
}

class _CapturedImageState extends State<CapturedImage> {
  final GlobalKey _globalKey = GlobalKey();
  bool isImageSaved = false;
  bool saving = false;

  makeImage() async {
    setState(() {
      saving = true;
    });
    convertWidgetToImage(_globalKey).then((value) async {
      GallerySaver.saveImage(value!.path, albumName: "MSocial").then((value) {
        setState(() {
          isImageSaved = true;
          saving = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: SizedBox(
              width: getPhoneWidth(context),
              height: getPhoneHeight(context),
              child: Transform.scale(
                scaleX: 1,
                scaleY: 1.005,
                filterQuality: FilterQuality.high,
                child:
                    widget.videoController == null && widget.imageFile == null
                        ? Container()
                        : SizedBox(
                            child: kIsWeb
                                ? Image.network(widget.imageFile!.path)
                                : Image.file(
                                    File(widget.imageFile!.path),
                                    fit: BoxFit.cover,
                                  ),
                            width: getPhoneWidth(context),
                            height: getPhoneHeight(context),
                          ),
              ),
            ),
          ),
          Positioned(
            top: 110,
            right: 5,
            child: Container(
              width: 40,
              height: 300,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(72)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.grid_on_outlined,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.camera_front_outlined,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.volume_up_sharp,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.flash_on_sharp,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.palette,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.text_fields_outlined,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.crop,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            width: getPhoneWidth(context),
            bottom: 0,
            child: SizedBox(
              height: 95,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!isImageSaved) {
                              makeImage();
                            }
                          },
                          child: saving
                              ? CircularProgressIndicator()
                              : Icon(
                                  isImageSaved
                                      ? Icons.check_circle
                                      : Icons.save_alt,
                                  color: Colors.white,
                                  size: isImageSaved ? 35 : 30,
                                ),
                        ),
                        Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color.fromRGBO(0, 96, 168, 1)),
                            child: const Center(
                                child: FaIcon(
                              Icons.send,
                              size: 34,
                              color: Colors.white,
                            ))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
              left: 10,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Color.fromRGBO(0, 0, 0, 0),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
