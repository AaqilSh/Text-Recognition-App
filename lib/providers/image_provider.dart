import 'package:text_recognition/model/data_layer.dart';
import 'package:text_recognition/providers/base_model.dart';
import 'package:text_recognition/repositories/exceptions.dart';
import 'package:text_recognition/repositories/media_service.dart';

class ImageViewModel extends BaseModel {
  ImageModel? _image;
  get image => _image;

  void getImage() async {
    //Clears previous picture from memory
    if (_image != null) {
      _image = null;
    }
    setState(CurrentState.loading);
    try {
      final _mediaService = MediaService();
      _image = await _mediaService.pickImageFromGallery();
      setState(CurrentState.loaded);
    } on ImageNotSelectedException {
      setState(CurrentState.error);
    } catch (e) {
      setState(CurrentState.error);
    }
  }
}
