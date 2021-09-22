import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_recognition/providers/base_model.dart';
import 'package:text_recognition/providers/image_provider.dart';
import 'package:text_recognition/providers/text_provider.dart';
import 'package:text_recognition/view/custom_widgets.dart/upload_image_button.dart';
import 'package:text_recognition/view/result_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
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
              builder: (_, imageProvider, __) =>
                  (imageProvider.state == CurrentState.loading)
                      ? const CircularProgressIndicator()
                      : (imageProvider.state == CurrentState.loaded)
                          ? Center(
                              child: Column(
                                children: [
                                  _displayImage(imageProvider.image!),
                                  CustomButton(
                                      text: 'Get another image',
                                      onTap: imageProvider.getImage)
                                ],
                              ),
                            )
                          : CustomButton(
                              text: 'Upload image',
                              onTap: imageProvider.getImage)),
          const SizedBox(
            height: 15.0,
          ),
          Consumer<TextViewModel>(
            builder: (_, textProvider, __) => TextButton(
                onPressed: () {
                  textProvider.getText();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ResultPage()));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => ListenableProvider<TextViewModel>.value(
                  //       value: textProvider,
                  //       child: const ResultPage(),
                  //     ),
                  //   ),
                  // );
                },
                child: const Text('Do something')),
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
      itemCount: text.processedTexts!.length,
      itemBuilder: (context, index) {
        return Center(
            child: Text('${index + 1}: ${text.processedTexts![index].text}'));
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
