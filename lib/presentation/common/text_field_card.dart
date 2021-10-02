import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//取引金額、取引名、メモを入力するTextFieldを囲うCardWidget
class TextFieldCard extends HookWidget {
  final TextEditingController textEditingController;
  const TextFieldCard({Key? key, required this.textEditingController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        controller: textEditingController,
        textAlign: TextAlign.center,
        //keyboardType: TextInputType.number, //キーボードは数値のみ
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        // onChanged: (valueTwo) {
        //   _number = int.parse(valueTwo.toString()); //String型からint型に変換
        // },
      ),
    );
  }
}
