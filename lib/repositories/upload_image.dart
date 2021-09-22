import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:text_recognition/model/data_layer.dart';

class MediaService {
  final ImagePicker _imagePicker = ImagePicker();
  File? image;

  Future<ImageModel?> pickImageFromGallery() async {
    try {
      final _image = await _imagePicker.pickImage(source: ImageSource.gallery);
      // image = File(_image!.path);
      final image = ImageModel(imagePath: _image!.path);
      return image;
    } catch (e) {
      throw Exception('No image');
    }
    // }
  }
}
