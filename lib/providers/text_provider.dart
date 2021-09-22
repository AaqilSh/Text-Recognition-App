import 'dart:io';

import 'package:text_recognition/model/data_layer.dart';
import 'package:text_recognition/providers/base_model.dart';
import 'package:text_recognition/providers/image_provider.dart';
import 'package:text_recognition/repositories/image_labelling.dart';

class TextViewModel extends BaseModel {
  SelectImageProvider? imageprovider;

  TextViewModel({this.imageprovider});

  List<RecognizedText>? _processedTexts;
  get processedTexts => _processedTexts;

  void getText() async {
    setLoading(true);
    try {
      File _image = imageprovider!.image;
      _processedTexts = await Helper().getText(_image);
      setEmpty(false);
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }
}
