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
  List<String>? _lables;
  List<String>? _texts;
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image recongnition'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25.0,
          ),
          Container(
            // alignment: Alignment.center,
            child: const Text('Hello how are you?'),
          ),
          Container(
            alignment: Alignment.center,
            child: (_image == null)
                ? Container()
                : Image.file(
                    _image!,
                  ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: _lables == null
                  ? Container()
                  : ListView.builder(
                      itemCount: _lables!.length,
                      itemBuilder: (context, index) {
                        return Text('${_lables![index]}');
                      },
                    ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: _texts == null
                  ? Container()
                  : ListView.builder(
                      itemCount: _texts!.length,
                      itemBuilder: (context, index) {
                        return Text('${_texts![index]}');
                      },
                    ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () async {
                var image = await pickImageFromGallery();
                setState(() {
                  _image = image;
                  _texts = null;
                  _lables = null;
                });
              },
              child: const Text('Upload image'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () async {
                var label = await Helper().getLabel(_image!);
                setState(() {
                  _lables = label;
                });
              },
              child: const Text('Get label'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () async {
                var texts = await Helper().getText(_image!);
                setState(() {
                  _texts = texts;
                });
              },
              child: const Text('Get texts'),
            ),
          ),
        ],
      ),
    );
  }
}
