import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isEmpty = true;
  bool get isEmpty => _isEmpty;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setEmpty(bool value) {
    _isEmpty = value;
    notifyListeners();
  }

  void get() {}
}
