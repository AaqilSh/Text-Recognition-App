import 'dart:io';

import 'package:image_picker/image_picker.dart';

final ImagePicker _imagePicker = ImagePicker();
File? image;

Future<File?> pickImageFromGallery() async {
  try {
    final _image = await _imagePicker.pickImage(source: ImageSource.gallery);
    image = File(_image!.path);
    return image!;
  } catch (e) {
    print(e);
  }
  // }
}
