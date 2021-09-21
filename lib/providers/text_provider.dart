import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:text_recognition/model/data_layer.dart';
import 'package:text_recognition/providers/image_provider.dart';
import 'package:text_recognition/repositories/image_labelling.dart';

class TextViewModel with ChangeNotifier {
  TextViewModel({this.imageprovider});

  SelectImageProvider? imageprovider;

  // SelectImageProvider imageProvider = SelectImageProvider.instance;

  List<RecognizedText>? _processedTexts;
  get processedTexts => _processedTexts;

  void setText() {
    _processedTexts = [];
    notifyListeners();
  }

  void getText() async {
    try {
      File _image = imageprovider!.image;
      _processedTexts = await Helper().getText(_image);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
