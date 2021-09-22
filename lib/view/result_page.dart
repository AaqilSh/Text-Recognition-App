import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_recognition/providers/base_model.dart';
import 'package:text_recognition/providers/text_provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

//   @override
//   _ResultPageState createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: Consumer<TextViewModel>(
        builder: (_, textProvider, __) =>
            (textProvider.state == CurrentState.idle)
                ? const Center(
                    child: Text('Nothing here'),
                  )
                : (textProvider.state == CurrentState.loading)
                    ? const Center(child: CircularProgressIndicator())
                    : Center(
                        child: _displayText(textProvider),
                      ),
      ),
    );
  }
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
