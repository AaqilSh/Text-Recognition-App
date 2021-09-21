import 'dart:io';
import 'package:google_ml_kit/google_ml_kit.dart';

// File? file;

class Helper {
  final _languageModelManager = GoogleMlKit.nlp.translateLanguageModelManager();
  final _onDeviceTranslator = GoogleMlKit.nlp.onDeviceTranslator(
      sourceLanguage: TranslateLanguage.ENGLISH,
      targetLanguage: TranslateLanguage.TAMIL);

  Future getLabel(File file) async {
    final inputImage = InputImage.fromFile(file);
    final imageLabeler = GoogleMlKit.vision.imageLabeler();
    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    List<String> _labelss = [];
    for (ImageLabel label in labels) {
      final String text = label.label;
      // final int index = label.index;
      // final double confidence = label.confidence;
      _labelss.add(text);
    }
    return _labelss;
  }

  Future<List<String>> getText(File file) async {
    final inputImage = InputImage.fromFile(file);
    final textDetector = GoogleMlKit.vision.textDetector();
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);

//   print(recognisedText.blocks);
    List<String> _texts = [];

    for (TextBlock block in recognisedText.blocks) {
      _texts.add(block.text);
    }

    return _texts;
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

  // Future translateText(String text) async {
  //   final _onDeviceTranslator = GoogleMlKit.nlp.onDeviceTranslator(
  //       sourceLanguage: TranslateLanguage.ENGLISH,
  //       targetLanguage: TranslateLanguage.TAMIL);
  //   final String response = await onDeviceTranslator.translateText(text);
  //   return response;
  // }

  Future<void> downloadModel() async {
    var result = await _languageModelManager.downloadModel('en');
    print('Model downloaded: $result');
    result = await _languageModelManager.downloadModel('ta');
    print('Model downloaded: $result');
  }

  Future<void> getAvailableModels() async {
    var result = await _languageModelManager.getAvailableModels();
    print('Available models: $result');
  }

  Future<void> isModelDownloaded() async {
    var result = await _languageModelManager.isModelDownloaded('es');
    print('Is model downloaded: $result');
    result = await _languageModelManager.isModelDownloaded('ta');
    print('Is model downloaded: $result');
  }

  Future<String> translateText(String text) async {
    var result = await _onDeviceTranslator.translateText(text);
    return result;
  }
}
