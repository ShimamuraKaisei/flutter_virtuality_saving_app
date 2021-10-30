import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//取引金額、取引名、メモを入力するTextFieldを囲うCardWidget
class TextFieldCard extends HookWidget {
  final TextEditingController textEditingController;
  final String title;
  const TextFieldCard(
      {Key? key, required this.textEditingController, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(title),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: textEditingController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
