import 'dart:io';
import 'package:google_ml_kit/google_ml_kit.dart';

// File? file;

Future getLabel(File? file) async {
  final inputImage = InputImage.fromFile(file!);
  final imageLabeler = GoogleMlKit.vision.imageLabeler();
  final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
  // for (ImageLabel label in labels) {
  //   final String text = label.label;
  //   final int index = label.index;
  //   final double confidence = label.confidence;
  // }
  return labels[0].label;
}
