import 'dart:io';

import 'package:text_recognition/model/data_layer.dart';
import 'package:text_recognition/providers/base_model.dart';
import 'package:text_recognition/providers/image_provider.dart';
import 'package:text_recognition/repositories/image_labelling.dart';

class TextViewModel extends BaseModel {
  late SelectImageProvider _imageprovider;
  List<RecognizedText>? _processedTexts;

  SelectImageProvider get imageProvider => _imageprovider;
  List<RecognizedText>? get processedTexts => _processedTexts;

  set imageProvider(SelectImageProvider imagePrivder) {
    _imageprovider = imagePrivder;
    notifyListeners();
  }

  void getText() async {
    setLoading(true);
    try {
      File _image = _imageprovider.image;
      _processedTexts = await Helper().getText(_image);
      setEmpty(false);
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }
}
