import 'dart:io';
import 'package:text_recognition/providers/base_model.dart';
import 'package:text_recognition/repositories/upload_image.dart';

class SelectImageProvider extends BaseModel {
  File? _image;
  get image => _image;

  void getImage() async {
    //Clears previous picture from memory
    if (_image != null) {
      _image = null;
    }
    setState(CurrentState.loading);
    try {
      _image = await pickImageFromGallery();
      setState(CurrentState.loaded);
    } catch (e) {
      setState(CurrentState.idle);
    }
  }
}
