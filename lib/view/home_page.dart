import 'dart:io';

import 'package:flutter/material.dart';
import 'package:text_recognition/services/image.dart';
import 'package:text_recognition/services/image_labelling.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _label;
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image recongnition'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text('Hello how are you?'),
          ),
          Container(
            alignment: Alignment.center,
            child: _image == null
                ? Container()
                : Image.file(
                    _image!,
                    // width: 200,
                    // height: 200,
                  ),
          ),
          Container(
            alignment: Alignment.center,
            child: _label == null ? Container() : Text(_label!),
          ),
          Container(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () async {
                var image = await pickImageFromGallery();
                setState(() {
                  _image = image;
                });
              },
              child: const Text('Upload image'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () async {
                var label = await getText(_image!);
                setState(() {
                  _label = label;
                });
              },
              child: const Text('Get label'),
            ),
          ),
        ],
      ),
    );
  }
}
