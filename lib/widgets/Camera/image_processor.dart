import 'dart:io';
import 'dart:math';
import 'package:image/image.dart' as IMG;

class ImageProcessor {
  static Future cropSquare(String srcFilePath, String destFilePath, bool flip,context) async {
    var bytes = await File(srcFilePath).readAsBytes();
    IMG.Image src = IMG.decodeImage(bytes)!;

    var cropSize =  150;
    int offsetX = (src.width - min(src.width, src.height)  +100) as int;
    int offsetY = (src.height - min(src.width, src.height)  +100) as int;

    IMG.Image destImage =
    IMG.copyCrop(src, offsetX, offsetY, 300, 700);
    destImage = IMG.copyResize(src, width: 400);
    if (flip) {
      destImage = IMG.flipHorizontal(destImage);
    }

    var jpg = IMG.encodeJpg(destImage);
    await File(srcFilePath).writeAsBytes(jpg);
  }


  static Future flipHorizontal(String srcFilePath, String destFilePath, bool flip,context) async {
    var bytes = await File(srcFilePath).readAsBytes();
    IMG.Image src = IMG.decodeImage(bytes)!;


    if(flip){
      src = IMG.flipHorizontal(src);
    }


    var jpg = IMG.encodeJpg(src);
    return jpg;
  }
}