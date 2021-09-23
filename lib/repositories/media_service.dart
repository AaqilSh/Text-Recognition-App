import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:text_recognition/model/data_layer.dart';
import 'package:text_recognition/repositories/exceptions.dart';

class MediaService {
  final ImagePicker _imagePicker = ImagePicker();
  File? image;

  Future<ImageModel?> pickImageFromGallery() async {
    try {
      final _image = await _imagePicker.pickImage(source: ImageSource.gallery);
      final image = ImageModel(imagePath: _image!.path);
      return image;
    } catch (e) {
      throw ImageNotSelectedException('Image not found');
    }
    // }
  }
}
