import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//取引金額、取引名、メモを入力するTextFieldを囲うCardWidget
class TextFieldCard extends HookWidget {
  final TextEditingController textEditingController;
  const TextFieldCard({Key? key, required this.textEditingController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: textEditingController,
        textAlign: TextAlign.center,
        //keyboardType: TextInputType.number, //キーボードは数値のみ
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
