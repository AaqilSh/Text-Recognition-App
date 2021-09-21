import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_recognition/providers/image_provider.dart';

class UploadImageButton extends StatelessWidget {
  const UploadImageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SelectImageProvider>(context);
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: provider.getImage,
        child: const Text('Upload image'),
      ),
    );
  }
}
