import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:text_recognition/providers/text_provider.dart';

import 'image_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<SelectImageProvider>(
    create: (context) => SelectImageProvider(),
  ),
  // ),
  ChangeNotifierProxyProvider<SelectImageProvider, TextViewModel>(
    create: (_) => TextViewModel(),
    update: (BuildContext context, SelectImageProvider imageProvider,
            TextViewModel? textprovider) =>
        TextViewModel(imageprovider: imageProvider),
    lazy: true,
  ),
];
