import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_recognition/providers/image_provider.dart';
import 'package:text_recognition/providers/text_provider.dart';
import 'package:text_recognition/view/custom_widgets.dart/upload_image_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<SelectImageProvider>(context, listen: false);
    final _textProvider = Provider.of<TextProvider>(context, listen: false);
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
          Consumer<SelectImageProvider>(
            builder: (_, myType, __) => (myType.image == null)
                ? const UploadImageButton()
                : Center(child: _displayImage(myType.image!)),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Consumer<TextProvider>(
            builder: (_, some, __) => some.processedTexts == null
                ? TextButton(
                    onPressed: () {
                      try {
                        _textProvider.getText(_provider.image!);
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text('Get text'),
                  )
                : Expanded(
                    child: ListView.separated(
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 7.0,
                      ),
                      itemCount: some.processedTexts.length,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Text(
                                '${index + 1}: ${some.processedTexts[index].text}'));
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Image _displayImage(File? image) {
    return Image.file(
      image!,
      height: 100,
    );
  }
}
