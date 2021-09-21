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
  // List<String>? _lables;
  // List<String>? _texts;
  // File? _image;
  // String? _translated;
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
          // Container(
          // alignment: Alignment.center,
          Consumer<SelectImageProvider>(
              builder: (_, myType, __) => (myType.image == null)
                  ? const UploadImageButton()
                  : _displayImage(_provider)),

          // ),

          Expanded(
            child: Consumer<TextProvider>(
              builder: (_, some, __) => Container(
                alignment: Alignment.center,
                child: some.processedTexts == null
                    ? TextButton(
                        onPressed: () {
                          _textProvider.getText(_provider.image);
                        },
                        child: Text('Get text'),
                      )
                    : ListView.builder(
                        itemCount: _textProvider.processedTexts.length,
                        itemBuilder: (context, index) {
                          return Text('${some.processedTexts[index]}');
                        },
                      ),
              ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     alignment: Alignment.center,
          //     child: _texts == null
          //         ? Container()
          //         : ListView.builder(
          //             itemCount: _texts!.length,
          //             itemBuilder: (context, index) {
          //               return Text('${_texts![index]}');
          //             },
          //           ),
          //   ),
          // ),
          // Expanded(child: Text("${_translated}")),
          // Container(
          //   alignment: Alignment.center,
          //   child: TextButton(
          //     onPressed: () async {
          //       var label = await Helper().getLabel(_image.image!);
          //       setState(() {
          //         _lables = label;
          //       });
          //     },
          //     child: const Text('Get label'),
          //   ),
          // ),
          // Container(
          //   alignment: Alignment.center,
          //   child: TextButton(
          //     onPressed: () async {
          //       var texts = await Helper().getText(_image.image!);
          //       setState(() {
          //         _texts = texts;
          //       });
          //     },
          //     child: const Text('Get texts'),
          //   ),
          // ),
          // Container(
          //   alignment: Alignment.center,
          //   child: TextButton(
          //     onPressed: () async {
          //       var texts = await Helper().translateText("${_texts![0]}");
          //       setState(() {
          //         _translated = texts;
          //       });
          //     },
          //     child: const Text('Translate'),
          //   ),
          // ),
        ],
      ),
    );
  }

  Image _displayImage(SelectImageProvider _provider) {
    return Image.file(
      _provider.image!,
      height: 100,
    );
  }
}
