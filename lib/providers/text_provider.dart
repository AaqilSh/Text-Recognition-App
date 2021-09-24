import 'package:text_recognition/model/data_layer.dart';
import 'package:text_recognition/providers/base_model.dart';
import 'package:text_recognition/providers/image_provider.dart';
import 'package:text_recognition/repositories/text_recongnize.dart';

class TextViewModel extends BaseModel {
  late ImageViewModel _imageProvider;

  List<RecognizedText>? _processedTexts;

  List<RecognizedText>? get processedTexts => _processedTexts;
  ImageViewModel get imageProvider => _imageProvider;

  set imageProvider(ImageViewModel imageProvider) {
    _imageProvider = imageProvider;
    // emptyList();
  }

  void getText() async {
    setState(CurrentState.loading);
    try {
      final _mlSerive = MlService();
      final ImageModel _image = _imageProvider.image;
      final String _imagePath = _image.imagePath!;
      _processedTexts = await _mlSerive.getText(_imagePath);
      setState(CurrentState.loaded);
    } catch (e) {
      setState(CurrentState.error);
    }
  }

  void emptyList() {
    _processedTexts = [];
  }
}
