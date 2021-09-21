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
    print('build called');
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
            builder: (_, imageProvider, __) => (imageProvider.image == null)
                ? const UploadImageButton()
                : Center(
                    child: Column(
                      children: [
                        _displayImage(imageProvider.image!),
                        TextButton(
                            onPressed: imageProvider.getImage,
                            child: const Text('Select another image'))
                      ],
                    ),
                  ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Consumer<TextViewModel>(
            builder: (_, text, __) => (text.processedTexts == null)
                ? TextButton(
                    onPressed: text.getText,
                    child: const Text('Get text'),
                  )
                : Flexible(
                    child: Column(
                      children: [
                        Flexible(
                          child: ListView.separated(
                            separatorBuilder: (_, __) => const SizedBox(
                              height: 7.0,
                            ),
                            itemCount: text.processedTexts.length,
                            itemBuilder: (context, index) {
                              return Center(
                                  child: Text(
                                      '${index + 1}: ${text.processedTexts[index].text}'));
                            },
                          ),
                        ),
                        Flexible(
                          child: TextButton(
                            onPressed: text.getText,
                            child: const Text('Get text'),
                          ),
                        )
                      ],
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
