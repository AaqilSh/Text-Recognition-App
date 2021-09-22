import 'dart:io';

import 'package:text_recognition/model/data_layer.dart';
import 'package:text_recognition/providers/base_model.dart';
import 'package:text_recognition/providers/image_provider.dart';
import 'package:text_recognition/repositories/image_labelling.dart';

class TextViewModel extends BaseModel {
  late SelectImageProvider _imageProvider;

  List<RecognizedText>? _processedTexts;

  List<RecognizedText>? get processedTexts => _processedTexts;
  SelectImageProvider get imageProvider => _imageProvider;

  set imageProvider(SelectImageProvider imageProvider) {
    emptyList();
    _imageProvider = imageProvider;
  }

  void getText() async {
    setState(CurrentState.loading);
    try {
      File _image = _imageProvider.image;
      _processedTexts = await Helper().getText(_image);
      setState(CurrentState.loaded);
    } catch (e) {
      setState(CurrentState.idle);
    }
  }

  void emptyList() {
    _processedTexts = [];
    notifyListeners();
  }
}
