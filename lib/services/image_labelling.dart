import 'dart:io';
import 'package:google_ml_kit/google_ml_kit.dart';

// File? file;

Future getLabel(File file) async {
  final inputImage = InputImage.fromFile(file);
  final imageLabeler = GoogleMlKit.vision.imageLabeler();
  final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
  // for (ImageLabel label in labels) {
  //   final String text = label.label;
  //   final int index = label.index;
  //   final double confidence = label.confidence;
  // }
  return labels[0].label;
}

Future getText(File file) async {
  final inputImage = InputImage.fromFile(file);
  final textDetector = GoogleMlKit.vision.textDetector();
  final RecognisedText recognisedText =
      await textDetector.processImage(inputImage);
  String text = recognisedText.text;

//   print(recognisedText.blocks);

  for (var block in recognisedText.blocks) {
    print(block.text);
  }

  return text;
//   for (TextBlock block in recognisedText.blocks) {
//     // final Rect rect = block.rect;
//     // final List<Offset> cornerPoints = block.cornerPoints;
//     final String text = block.text;
//     final List<String> languages = block.recognizedLanguages;

//     for (TextLine line in block.lines) {
//       // Same getters as TextBlock
//       for (TextElement element in line.elements) {
//         // Same getters as TextBlock
//       }
//     }
//   }
}
