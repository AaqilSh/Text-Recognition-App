import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:text_recognition/providers/text_provider.dart';
import 'package:text_recognition/repositories/upload_image.dart';

class SelectImageProvider with ChangeNotifier {
  SelectImageProvider({this.textProvider});
  TextViewModel? textProvider;

  static final SelectImageProvider _singleton = SelectImageProvider();
  static SelectImageProvider get instance => _singleton;

  File? _image;
  get image => _image;

  void getImage() async {
    try {
      _image = await pickImageFromGallery();
      notifyListeners();
    } catch (e) {}
  }

  void getAnotherImage() {
    getImage();
    textProvider!.setText();
    notifyListeners();
  }
}
