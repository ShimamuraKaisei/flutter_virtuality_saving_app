import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/common/%20keyboardoverlay.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

//取引金額、取引名、メモを入力するTextFieldを囲うCardWidget
class MoneyTextFieldCard extends HookWidget {
  final TextEditingController textEditingController;
  final String title;
  final TextInputType type;
  final TextInputFormatter format;
  final FocusNode focusNode;
  const MoneyTextFieldCard({
    Key? key,
    required this.textEditingController,
    required this.title,
    required this.type,
    required this.format,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      focusNode.addListener(() {
        bool hasFocus = focusNode.hasFocus;
        if (hasFocus) {
          KeyboardOverlay.showOverlay(context);
        } else {
          KeyboardOverlay.removeOverlay();
        }
      });
    });
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(title),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              focusNode: focusNode,
              inputFormatters: [format], //予定外のtextがTextFieldに入力されることを防ぐ（コピペ防止）
              controller: textEditingController,
              keyboardType: type, //キーボード指定
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
