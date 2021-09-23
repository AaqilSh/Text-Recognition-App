import 'package:flutter/material.dart';
import 'package:text_recognition/providers/text_provider.dart';

class DisplayText extends StatelessWidget {
  final TextViewModel? text;
  const DisplayText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: 7.0,
      ),
      itemCount: text!.processedTexts!.length,
      itemBuilder: (context, index) {
        return Center(
            child: Text('${index + 1}: ${text!.processedTexts![index].block}'));
      },
    );
  }
}
