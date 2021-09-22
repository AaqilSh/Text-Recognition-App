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
            builder: (_, imageProvider, __) => imageProvider.isLoading
                ? const CircularProgressIndicator()
                : (imageProvider.isEmpty)
                    ? CustomButton(
                        text: 'Upload image', onTap: imageProvider.getImage)
                    : Center(
                        child: Column(
                          children: [
                            _displayImage(imageProvider.image!),
                            CustomButton(
                                text: 'Get another image',
                                onTap: imageProvider.getImage)
                          ],
                        ),
                      ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Consumer<TextViewModel>(
            builder: (_, text, __) => text.isLoading
                ? const CircularProgressIndicator()
                : (text.isEmpty)
                    ? CustomButton(text: 'Get text', onTap: text.getText)
                    : Flexible(
                        child: Column(
                          children: [
                            Flexible(
                              child: _displayText(text),
                            ),
                            Flexible(
                                child: CustomButton(
                                    text: 'Get text', onTap: text.getText))
                          ],
                        ),
                      ),
          ),
        ],
      ),
    );
  }

  ListView _displayText(TextViewModel text) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: 7.0,
      ),
      itemCount: text.processedTexts.length,
      itemBuilder: (context, index) {
        return Center(
            child: Text('${index + 1}: ${text.processedTexts[index].text}'));
      },
    );
  }

  Image _displayImage(File? image) {
    return Image.file(
      image!,
      height: 100,
    );
  }
}
