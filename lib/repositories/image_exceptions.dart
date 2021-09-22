class BaseException implements Exception {
  String? message;
}

class ImageNotFoundException extends BaseException {}
