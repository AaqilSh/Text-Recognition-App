import 'dart:io';

import 'package:image_picker/image_picker.dart';

final ImagePicker _imagePicker = ImagePicker();
File? image;

Future pickImageFromGallery() async {
  final _image = await _imagePicker.pickImage(source: ImageSource.gallery);
  // if (_image == null) {
  //   return;
  // // } else {
  image = File(_image!.path);
  return image;
  // }
}
