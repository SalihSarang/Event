//Converting the XFile to Base64

import 'dart:convert';
import 'package:image_picker/image_picker.dart';

Future<String> imageConvertion(XFile image) async {
  final newImage = await image.readAsBytes();

  return base64Encode(newImage);
}
