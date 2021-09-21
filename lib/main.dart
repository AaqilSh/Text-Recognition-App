import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_recognition/providers/image_provider.dart';
import 'package:text_recognition/providers/text_provider.dart';
import 'package:text_recognition/view/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider<SelectImageProvider>(
          create: (context) => SelectImageProvider(),
        ),
        ChangeNotifierProvider<TextProvider>(
          create: (context) => TextProvider(),
        ),
      ], child: const HomePage()),
    );
  }
}
