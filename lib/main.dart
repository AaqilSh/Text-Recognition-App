import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_recognition/providers/provider_setup.dart';
import 'package:text_recognition/view/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
          title: 'Flutter Demo',
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
          theme: ThemeData.dark(),
          darkTheme: ThemeData.dark(),
          home: const HomePage()),
    );
  }
}
