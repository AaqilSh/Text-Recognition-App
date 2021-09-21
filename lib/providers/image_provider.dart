import 'dart:io';

import 'package:flutter/cupertino.dart';
// import 'package:text_recognition/model/data_layer.dart';
import 'package:text_recognition/repositories/image.dart';

class SelectImageProvider with ChangeNotifier {
  File? _image;
  get image => _image;
  void getImage() async {
    _image = await pickImageFromGallery();
    notifyListeners();
    setImage(_image!);
  }

  void setImage(File image) {
    _image = image;
  }
}
