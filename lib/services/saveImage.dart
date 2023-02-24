import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

Future <String> saveImage(Uint8List pic) async {
  await [Permission.storage].request();
  final time = DateTime.now()
      .toIso8601String()
      .replaceAll(".", '-')
      .replaceAll(":", "-");
  final name = 'QR_pic_$time';
  final res = await ImageGallerySaver.saveImage(pic, name: name);
  return res['filePath'];
}