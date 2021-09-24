import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function()? onTap;
  const CustomButton({
    this.onTap,
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          text!,
        ),
      ),
    );
  }
}
