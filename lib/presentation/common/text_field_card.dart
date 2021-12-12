import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//取引金額、取引名、メモを入力するTextFieldを囲うCardWidget
class TextFieldCard extends HookWidget {
  final TextEditingController textEditingController;
  final String title;
  final TextInputType type;
  final TextInputFormatter format;
  // final FocusNode focusNode;
  const TextFieldCard({
    Key? key,
    required this.textEditingController,
    required this.title,
    required this.type,
    required this.format,
    // required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text(title),
              ),
              Flexible(
                child: TextField(
                  inputFormatters: [format], //予定外のtextがTextFieldに入力されることを防ぐ（コピペ防止）
                  controller: textEditingController,
                  keyboardType: type, //キーボード指定
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(right: 10), //TextFieldをContainerでwrapしてpaddingを弄ろうとするとエラー
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
