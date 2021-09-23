import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final String? path;
  const DisplayImage(this.path, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(path!),
      height: 100,
    );
  }
}
