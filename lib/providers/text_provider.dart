import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:text_recognition/model/data_layer.dart';
import 'package:text_recognition/providers/image_provider.dart';
import 'package:text_recognition/repositories/image_labelling.dart';

class TextProvider with ChangeNotifier {
  List<RecognizedText>? _processedTexts;
  get processedTexts => _processedTexts;

  void getText() async {
    final _image = SelectImageProvider().image;
    print(_image);
    try {
      _processedTexts = await Helper().getText(_image);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
