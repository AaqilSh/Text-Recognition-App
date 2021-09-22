import 'dart:io';
import 'package:text_recognition/providers/base_model.dart';
import 'package:text_recognition/repositories/upload_image.dart';

class SelectImageProvider extends BaseModel {
  // TextViewModel? textProvider;
  // SelectImageProvider({this.textProvider});

  File? _image;
  get image => _image;

  void getImage() async {
    setLoading(true);
    try {
      _image = await pickImageFromGallery();
      setEmpty(false);
      // notifyListeners();
    } catch (e) {
    } finally {
      setLoading(false);
    }
  }
}
