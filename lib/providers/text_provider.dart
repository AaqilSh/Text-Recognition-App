import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:text_recognition/services/image_labelling.dart';

class TextProvider with ChangeNotifier {
  List<String>? _processedTexts;
  get processedTexts => _processedTexts;

  void getText(File image) async {
    _processedTexts = await Helper().getText(image);
    notifyListeners();
  }
}
